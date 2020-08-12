import Dayjs from "dayjs"
import Flatpickr from "flatpickr"
import {Select} from "../../components/inputs/Select"

export default tag Form
	prop errors = {}
	prop loading
	prop model
	prop target = {}
	prop relations = {}
	prop date_pickers = []
	prop flatpickers = []

	def mount
		target = await model.find(id)
		mountDatePickers()
		id = Router.path.slice(-1)
		if model.belongs_to
			for own rel, type of model.form
				continue unless Model.models[type]
				relations[rel] = await Model.models[type].class.all()
		render()

	def fieldName field
		I18n.t.models[model.plural_name].fields[field]

	def relationName type
		I18n.t.models[Model.models[type].plural_name].human_name

	def close
		emit('close')

	def submit
		try
			let save = await target.save()
			console.log save
			if (save)
				STATE.alerts.push(type: 'success', msg: I18n.t.pages.crud.success)
				Router.go("/{model.singular_name}/{target.id}")
			else
				STATE.alerts.push(type: 'error', msg: I18n.t.pages.crud.error)
				errors = target.errors
		catch err
			console.log(err)
			STATE.alerts.push(type: 'error', msg: err)


	def mountDatePickers
		for own field, el of date_pickers
			continue if flatpickers[field]
			flatpickers[field] = Flatpickr(el, {
				enableTime: true,
				dateFormat: 'd/m/Y - h:i K',
				defaultDate: Dayjs().format('DD/MM/YYYY - hh:mm')
			})

	def selectOptions relation
		for rec in relations[relation]
			{option: rec.main_field, value: rec.id}

	def unmount
		emit('close')
		flatpickers.map do $1.destroy()

	def changeRelation e
		target[e.target.name] = relations[e.target.name].find(do |rel| rel.id == e.detail)
		target["{e.target.name}_id"] = relations[e.target.name].find(do |rel| rel.id == e.detail).id

	def changeInput e
		target[e.target.name] = e.target.value
		render()

	
	<self>
		<header .content__title>
			if target.id
				<h1> " {I18n.t.pages.crud['edit']} {I18n.t.models[model.plural_name].human_name}"
			else	
				<h1> " {I18n.t.pages.crud['new']} {I18n.t.models[model.plural_name].human_name}"
		<div .card .fadeIn>
			<div .card-body>
				<form>
					if errors.len
						<div .alert .alert-danger>
							for own field, msgs of errors
								for error in msgs
									<p>
										" • {fieldName(field)} {error[0]}"
					<div .form-row>
						for own field, type of model.form
							<div .col-md-4>
								<div .form-group>
									<label>
										if Model.models[type]
											relationName(type)
										else
											fieldName(field)
									if Model.models[type]
										<Select 
											value=(target[field] or {}).id 
											name=field 
											:change.changeRelation 
											options=selectOptions(field) 
											placeholder=I18n.t.select>

									elif type == :date
										date_pickers[field] = <input bind=target[field]
											.form-control 
											.form-control-lg>
									else
										<input 
											value=(target[field] or '') 
											:keyup.changeInput 
											name=field 
											type="text" 
											.form-control 
											.form-control-lg 
											autocomplete="off"
											placeholder=fieldName(field)>

									if errors[field]
										<small .validation-error name="{field}-validation">
											errors[field]
			<div .card-footer>
				<div .btn-group .card-submit>
					<button type="button" .btn .btn-danger :click.emit('close')>
						I18n.t.pages.crud.cancel
					<button type="button" .btn .btn-primary :click.submit>
						if target.id then I18n.t.pages.crud.save else I18n.t.pages.crud.add
						if loading then <i .zmdi .zmdi-spinner .zmdi-hc-spin>

	css .card-footer
		height: 75px
		.card-submit 
			position: absolute
			right: 20px
			bottom: 20px
			.btn
				margin-left: 20px