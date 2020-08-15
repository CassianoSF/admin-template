import Dayjs from "dayjs"
import Flatpickr from "flatpickr"
import Select from "../../components/inputs/Select"

export default tag Form
	prop errors = {}
	prop loading
	prop model
	prop target = {}
	prop relations = {}
	prop date_pickers = []
	prop flatpickers = []

	def mount
		if Router.to(model.singular_name + '/new')
			target = model.new
		elif Router.to(model.singular_name + '/edit')
			let id = Router.path.slice(-1)[0]
			target = await model.find(id)
		mountDatePickers()
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
		Router.go("/{model.singular_name}")

	def submit
		let save = await target.save()
		if (save)
			STATE.alerts.push(type: 'success', msg: I18n.t.pages.crud.success)
			Router.go("/{model.singular_name}/{target.id}")
		else
			STATE.alerts.push(type: 'error', msg: I18n.t.pages.crud.error)
			errors = target.errors or {}
			render()

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
					if errors.length
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
										if model.belongs_to[type]
											relationName(type)
										else
											fieldName(field)
									if model.belongs_to[type]
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
									elif type == :string
										<input 
											value=(target[field] or '') 
											:keyup.changeInput 
											name=field 
											type="text" 
											.form-control 
											.form-control-lg 
											autocomplete="off"
											placeholder=fieldName(field)>
									elif type == :integer
										<input 
											value=(target[field] or '') 
											:keyup.changeInput 
											name=field 
											type="number"
											min="0" step="1"
											.form-control 
											.form-control-lg 
											autocomplete="off"
											placeholder=fieldName(field)>
									elif type == :float or type == :decimal
										<input 
											value=(target[field] or '') 
											:keyup.changeInput 
											name=field 
											type="number"
											.form-control 
											.form-control-lg 
											autocomplete="off"
											placeholder=fieldName(field)>

									if errors[field]
										for error in errors[field]
											<small .validation-error name="{field}-validation">
												error

				<PermissionForm bind:permissions=target.permissions> if model.form.permissions

			<div .card-footer>
				<div .btn-group .card-submit>
					<button type="button" .btn .btn-danger :click.close>
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


tag PermissionForm
	def visit
		if permissions and permissions.length == 0
			for own _, model of Model.models 
				permissions.push(Permission.new(
					model: model.plural_name
				))
		render()

	<self>
		<.listview>
			for permission in permissions
				<.row [p: 1rem bg@hover: rgba(0,0,0,0.4)  border-bottom: 1px solid rgba(255,255,255,0.2);]>
					<.col-md-2>
						<div .listview__heading> I18n.t.models[permission.model].plural_name
					<.col-md-2>
						<label .custom-control .custom-checkbox .align-self-start>
							<input bind=permission.see type="checkbox" .custom-control-input>
							<span .custom-control-indicator>
							<span .custom-control-description> I18n.t.models.permissions.fields.see
					<.col-md-2>
						<label .custom-control .custom-checkbox .align-self-start>
							<input bind=permission.add type="checkbox" .custom-control-input>
							<span .custom-control-indicator>
							<span .custom-control-description> I18n.t.models.permissions.fields.add
					<.col-md-2>
						<label .custom-control .custom-checkbox .align-self-start>
							<input bind=permission.edit type="checkbox" .custom-control-input>
							<span .custom-control-indicator>
							<span .custom-control-description> I18n.t.models.permissions.fields.edit
					<.col-md-2>
						<label .custom-control .custom-checkbox .align-self-start>
							<input bind=permission.remove type="checkbox" .custom-control-input>
							<span .custom-control-indicator>
							<span .custom-control-description> I18n.t.models.permissions.fields.remove
					<.col-md-2>
						<label .custom-control .custom-checkbox .align-self-start>
							<input bind=permission.access type="checkbox" .custom-control-input>
							<span .custom-control-indicator>
							<span .custom-control-description> I18n.t.models.permissions.fields.access
