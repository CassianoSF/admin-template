import Flatpickr from "/web_modules/flatpickr"
import Dayjs from "/web_modules/dayjs"
import {Select} from "../components/inputs/Select"
import {Confirm} from "../components/ui/Confirm"


export tag CrudLotes
	prop records = []
	prop relations = {}
	prop target
	prop confirm

	def mount
		target = null
		loadRecords()
	
	def loadRecords
		records = await Lote.all()
		relations = {}
		if Lote.belongs_to
			for own rel, meta of Lote.belongs_to
				relations[rel] = await meta.type.all()
		render


	def addRecord
		target = new Lote

	def closeForm
		target = null
		loadRecords()

	def select rec
		Router.go('/lotes/' + rec.id)

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
		Object.keys(Lote.belongs_to).includes(field)

	def confirmClose
		confirm = false

	<self .fadeIn .animated>
		if confirm
			<Confirm :submit.destroy :close.confirmClose message=I18n.t.pages.crud.confirm>
		if Router.path.slice(-1) != 'lotes'
			<Show>
		elif target
			<Form :close.closeForm target=target relations=relations>
		else
			<header .content__title>
				<h1> 
					I18n.t.models[Lote.table_name].plural_name
			<div .card .animated .fadeIn>
				<div .card-body>
					<div .table-responsive>
						<div .dataTables_wrapper .no-footer>
							if records.length
								<table .table>
									<thead>
										for own field, meta of Lote.index
											if isRelation(field)
												<th> I18n.t.models[meta.type.table_name].human_name
											else
												<th> I18n.t.models[Lote.table_name].fields[field]
										<th>
										<th>
									<tbody>
										for rec in records
											<tr .main_table_tr>
												for own field, meta of Lote.index
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

tag Show
	prop target = {}

	def mount
		id = Router.path.slice(-1)
		target = await Lote.table.get(id)
		render()

	<self .animated .fadeIn>
		<header .content__title>
			<h1> 
				<a :click=(Router.go('/lotes'))> I18n.t.models[Lote.table_name].plural_name
				<i[mx: 10px] .zmdi .zmdi-arrow-right>
				target.codigo
		<div[mb: 40px] .row>
			<div .col-md-4>
				<div[p: 20px] .card>
					<div .card-title> target.codigo
					<p .card-subtitle> 'Código'
			<div .col-md-4>
				<div[p: 20px] .card>
					<div .card-title> Dayjs(target.created_at).format('DD/MM/YYYY - hh:mm')
					<p .card-subtitle> 'Criado em'
			<div .col-md-4>
				<div[p: 20px] .card>
					<div .card-title> Dayjs(target.updated_at).format('DD/MM/YYYY - hh:mm')
					<p .card-subtitle> 'Atualizado em'
			<div .col-md-4>
				<div[p: 20px] .card>
					<div .card-title> "{3} Produções"
					<p .card-subtitle> 'nos últimos 12 mêses'
			<div .col-md-4>
				<div[p: 20px] .card>
					<div .card-title> "{78451} Ovos"
					<p .card-subtitle> 'nos últimos 12 mêses'
			<div .col-md-4>
				<div[p: 20px] .card>
					<div .card-title> "{72517} Pintos"
					<p .card-subtitle> 'nos últimos 12 mêses'
		<header .content__title>
			<h1>  "Produções"
		<div.card>
			<div.listview.listview--hover>
				<div.listview__item>
					<div.listview__content>
						<div.listview__heading> Dayjs(target.updated_at).format('DD/MM/YYYY - hh:mm')
						<p> "Integrado - BRF"
			<div.listview.listview--hover>
				<div.listview__item>
					<div.listview__content>
						<div.listview__heading> Dayjs(target.updated_at).format('DD/MM/YYYY - hh:mm')
						<p> "Integrado - BRF"
			<div.listview.listview--hover>
				<div.listview__item>
					<div.listview__content>
						<div.listview__heading> Dayjs(target.updated_at).format('DD/MM/YYYY - hh:mm')
						<p> "Em incubação - Incubadora S4"




tag Form
	prop errors = {}
	prop loading
	prop Lote
	prop target
	prop relations = {}
	prop date_pickers = []
	prop flatpickers = []


	def fieldName field
		I18n.t.models[Lote.table_name].fields[field]

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
			if target.id
				<h1> " {I18n.t.pages.crud['edit']} {I18n.t.models[Lote.table_name].human_name}"
			else	
				<h1> " {I18n.t.pages.crud['new']} {I18n.t.models[Lote.table_name].human_name}"
		<div .card .animated .fadeIn>
			<div .card-body>
				<form>
					if errors.len
						<div .alert .alert-danger>
							for own field, msgs of errors
								for error in msgs
									<p>
										" • {fieldName(field)} {error[0]}"
					<div .form-row>
						for own field, meta of Lote.inputs
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