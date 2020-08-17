import Dayjs from "dayjs"
import Confirm from "../../components/ui/Confirm"

export default tag Index
	prop model
	prop records = []

	def mount
		loadModels()
		render()
	
	def loadModels
		records = await model.all()
		relations = {}
		if model.belongs_to
			for own rel, type of model.form
				continue unless Model.models[type]
				relations[rel] = await Model.models[type].class.all()
		render()

	def add
		Router.go("/{model.singular_name}/new")

	def edit rec
		Router.go("/{model.singular_name}/edit/" + rec.id)

	def show rec
		Router.go("/{model.singular_name}/" + rec.id)

	def destroy
		confirm.delete()
		let index = records.indexOf(confirm)
		records.splice(index, 1)
		confirm = null
		STATE.alerts.push(type: 'success', msg: I18n.t.pages.crud.success_destroy)
		render()

	def confirmClose
		confirm = false

	def delete rec
		confirm = rec

	<self>
		<header .content__title>
			<h1> 
				<a :click=(Router.go('/'))> 'Home'
				<i[mx: 10px] .zmdi .zmdi-chevron-right .zmdi-hc-lg>
				I18n.t.models[model.plural_name].plural_name
		if confirm
			<Confirm :submit.destroy :close.confirmClose message=I18n.t.pages.crud.confirm>
		<div .card .fadeIn>
			<div .card-body>
				<div .table-responsive>
					<div .dataTables_wrapper .no-footer>
						if records.length
							<table .table>
								<thead [background-color: rgba(255,255,255,0.1)]>
									for own field, type of model.index
										if model.hasRelation(field)
											<th> I18n.t.models[Model.models[type].class.plural_name].human_name
										else
											<th> I18n.t.models[model.plural_name].fields[field]
									<th>
									<th>
								<tbody>
									for rec in records
										<tr .main_table_tr>
											for own field, type of model.index
												if model.hasRelation(field)
													<td @click.show(rec)> rec[field].main_field
												elif type == :date
													<td @click.show(rec)> Dayjs.new(rec[field]).format('DD/MM/YYYY - hh:mm')
												else
													<td @click.show(rec)> rec[field]
											<td @click.delete(rec) .table-action title="Excluir">
												<a .zmdi .zmdi-delete>
											<td  @click.edit(rec) .table-action title="Editar">
												<a .zmdi .zmdi-edit>
						else
							<div[ta: center]> "Sem registros"

			<div .card-footer>
				<div .btn-group .card-submit>
					<button :click.add .btn .btn-success>
						<i .zmdi .zmdi-plus>
						' Adicionar' 