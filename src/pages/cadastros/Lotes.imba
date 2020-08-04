import Flatpickr from "flatpickr"
import Dayjs from "dayjs"
import {Select} from "../../components/inputs/Select"


export tag Lotes
	prop records = []
	prop target
	prop confirm

	def mount
		target = null
		loadRecords()
	
	def loadRecords
		records = await Lote.all()
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

	def edit rec
		target = rec

	def destroy
		confirm.delete()
		let index = records.indexOf(confirm)
		records.splice(index, 1)
		confirm = undefined

	def isRelation field
		Object.keys(Lote.belongs_to).includes(field)

	<self .fadeIn .animated>
		if confirm
			<button @click.destroy .btn .btn-danger> "Tem certeza"
		elif target
			<Form @close.closeForm model=model target=target>
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


tag LotesForm
	prop errors = {}
	prop loading
	prop model
	prop target
	prop relations = {}
	prop date_pickers = []
	prop flatpickers = []


	def fieldName field
		I18n.t.models[Lote.table_name].fields[field]

	def close
		emit :close

	def submit
		let save = await target.save()
		if (save)
			STATE.alerts.push(type: 'success', msg: I18n.t.pages.crud.success)
			close()
		else
			STATE.alerts.push(type: 'error', msg: I18n.t.pages.crud.error)
			errors = target.errors

	def mount
		mountDatePickers()

	def mountDatePickers
		for own field, el of date_pickers
			continue if flatpickers[field]
			flatpickers[field] = Flatpickr(el, {
				enableTime: true,
				dateFormat: 'd/m/Y - h:i K',
				defaultDate: Dayjs().format('DD/MM/YYYY - hh:mm')
			})

	def options relation
		for rec in relations[relation]
			{option: rec.main_field, value: rec.id}

	def unmount
		target = null
		flatpickers.map do $1.destroy()

	def changeSelect payload, field
		console.log
		target[field] = relations[field].find(do |rel| rel.id == payload)

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
						<div .col-md-4>
							<div .form-group>
								<label> "Ano"
									<input bind=target[field] name=field type="text" .form-control .form-control-lg placeholder=fieldName(field)>
								if errors.ano
									<small .validation-error name="{field}-validation">
										errors.ano
						<div .col-md-4>
							<div .form-group>
								<label> "Granja"
								<Select 
									value=(target.granja or {}).id
									:change=(do |e| changeSelect(e.detail, 'granja')) 
									options=options('granja')>
								if errors.granja
									<small .validation-error name="{field}-validation">
										errors.granja
			<div .card-footer>
				<div .btn-group .card-submit>
					<button type="button" .btn .btn-danger :click.close>
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