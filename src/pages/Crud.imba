import Flatpickr from "flatpickr"
import Dayjs from "dayjs"
import {Select} from "../components/inputs/Select"
import {Confirm} from "../components/ui/Confirm"


export tag Crud
	prop records = []
	prop relations = {}
	prop model
	prop target
	prop confirm

	def mount
		target = null
		loadRecords()
	
	def loadRecords
		records = await model.all()
		relations = {}
		if model.belongs_to
			for own rel, meta of model.belongs_to
				relations[rel] = await meta.type.all()
		render

	def addRecord
		target = new model

	def closeForm
		target = null
		loadRecords()

	def select rec
		console.log rec

	def delete rec
		confirm = rec
		render()

	def edit rec
		target = rec

	def destroy
		confirm.delete()
		let index = records.indexOf(confirm)
		records.splice(index, 1)
		confirm = null
		STATE.alerts.push(type: 'success', msg: I18n.t.pages.crud.success_destroy)
		render()

	def isRelation field
		Object.keys(model.belongs_to).includes(field)

	def confirmClose
		confirm = false

	<self .fadeIn>
		if confirm
			<Confirm :submit.destroy :close.confirmClose message=I18n.t.pages.crud.confirm>
		if target
			<Form :close.closeForm model=model target=target relations=relations>
		else
			<header .content__title>
				<h1> 
					I18n.t.models[model.table_name].plural_name
			<div .card .fadeIn>
				<div .card-body>
					<div .table-responsive>
						<div .dataTables_wrapper .no-footer>
							if records.length
								<table .table>
									<thead>
										for own field, meta of model.index
											if isRelation(field)
												<th> I18n.t.models[meta.type.table_name].human_name
											else
												<th> I18n.t.models[model.table_name].fields[field]
										<th>
										<th>
									<tbody>
										for rec in records
											<tr .main_table_tr>
												for own field, meta of model.index
													if isRelation(field)
														<td @click.select(rec)> rec[field].main_field
													else
														<td @click.select(rec)> rec[field]
												<td @click.delete(rec) .table-action title="Excluir">
													<a .zmdi .zmdi-delete>
												<td  @click.edit(rec) .table-action title="Editar">
													<a .zmdi .zmdi-edit>
							else
								<div[ta: center]> "Sem registros"

				<div .card-footer>
					<div .btn-group .card-submit>
						<button :click.addRecord .btn .btn-success>
							<i .zmdi .zmdi-plus>
							' Adicionar'


tag Form
	prop errors = {}
	prop loading
	prop model
	prop target
	prop relations = {}
	prop date_pickers = []
	prop flatpickers = []


	def fieldName field
		I18n.t.models[model.table_name].fields[field]

	def relationName rel
		I18n.t.models[rel.table_name].human_name

	def close
		emit('close')

	def submit
		try
			if (target.save())
				STATE.alerts.push(type: 'success', msg: I18n.t.pages.crud.success)
				emit('close')
			else
				STATE.alerts.push(type: 'error', msg: I18n.t.pages.crud.error)
				errors = target.errors
		catch err
			console.log(err)
			STATE.alerts.push(type: 'error', msg: err)


	def mount
		errors = {}
		mountDatePickers()
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
		let test = for rec in relations[relation]
			{option: rec.main_field, value: rec.id}
		test

	def unmount
		emit('close')
		flatpickers.map do $1.destroy()

	def changeSelect e
		target[e.target.name] = relations[e.target.name].find(do |rel| rel.id == e.detail)

	def changeInput e
		target[e.target.name] = e.target.value
		render()

	<self>
		<header .content__title>
			console.log target
			if target.id
				<h1> " {I18n.t.pages.crud['edit']} {I18n.t.models[model.table_name].human_name}"
			else	
				<h1> " {I18n.t.pages.crud['new']} {I18n.t.models[model.table_name].human_name}"
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
						for own field, meta of model.inputs
							<div .col-md-4>
								<div .form-group>
									<label>
										if meta.type.prototype instanceof Record
											relationName(meta.type)
										else
											fieldName(field)
									if meta.type.prototype instanceof Record
										<Select 
											value=(target[field] or {}).id 
											name=field 
											:change.changeSelect 
											options=selectOptions(field) 
											placeholder=I18n.t.select>

									elif meta.type == :Date
										date_pickers[field] = <input
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
											autocomplate="off"
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
						if loading
							<i .zmdi .zmdi-spinner .zmdi-hc-spin>

	css .card-footer
		height: 75px
		.card-submit 
			position: absolute
			right: 20px
			bottom: 20px
			.btn
				margin-left: 20px