import Dayjs from "dayjs"
import Select from "../../components/inputs/Select"
import DatePicker from "../../components/inputs/DatePicker"

export default tag Form
	prop errors = {}
	prop loading
	prop model
	prop target = {}
	prop relations = {}

	def mount
		if Router.to(model.singular_name + '/new')
			target = model.new
		elif Router.to(model.singular_name + '/edit')
			let id = Router.path.slice(-1)[0]
			target = await model.find(id)

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
		Router.goBack()

	def submit
		loading = true
		let save
		try
			save = await target.save()
		catch err
			STATE.alerts.push(type: 'danger', msg: err.message)
			loading = false
			render()
			return

		if (save)
			STATE.alerts.push(type: 'success', msg: I18n.t.pages.crud.success)
			Router.go("/{model.singular_name}/{target.id}")
		else
			STATE.alerts.push(type: 'danger', msg: I18n.t.pages.crud.error)
			errors = target.errors or {}
		loading = false
		render()

	def selectOptions relation
		for rec in relations[relation]
			{option: rec.main_field, value: rec.id}

	def changeRelation e
		target[e.target.name] = relations[e.target.name].find(do |rel| rel.id == e.detail)
		target["{e.target.name}_id"] = relations[e.target.name].find(do |rel| rel.id == e.detail).id

	def changeInput e
		target[e.target.name] = e.target.value
		render()

	
	<self>
		console.log target
		<header .content__title>
			if target.id
				<h1> " {I18n.t.pages.crud['edit']} {I18n.t.models[model.plural_name].human_name}"
			else	
				<h1> " {I18n.t.pages.crud['new']} {I18n.t.models[model.plural_name].human_name}"
		<div .card .fadeIn>
			<div .card-body>
				<div .btn-group .card-submit>
					<button .btn .btn-danger :click.close>
						I18n.t.pages.crud.cancel
					<button .btn .btn-primary :click.submit>
						if target.id then I18n.t.pages.crud.save else I18n.t.pages.crud.add
						if loading
							' '
							<i .zmdi .zmdi-spinner .zmdi-hc-spin>
				<form[mt: 20px]>
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
										<DatePicker value=target[field]>
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
			for permission in (permissions or []).sort(do(a, b) a.model.localeCompare(b.model))
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
