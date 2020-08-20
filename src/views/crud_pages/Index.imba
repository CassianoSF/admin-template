import Dayjs from "dayjs"
import Confirm from "../../components/ui/Confirm"
import Pagination from "../../components/table/Pagination"

export default tag Index
	prop model
	prop records = []
	prop pagination = {}
	prop query = {}

	def visit
		await execQuery()
		render()

	def mount
		pagination = {
			record_count: 0
			per_page: 50
			page_count: 0
			current_page: 0
		}
		await execQuery()
		render()

	def execQuery
		pagination.record_count = await model.table.count()
		pagination.page_count = Math.ceil(pagination.record_count / 50)
		let data = await model.table
			.offset(pagination.current_page * 50)
			.limit(50)
			.with(model.includes)
		records = data.map do |rec| model.ormRecord(rec)

	def changePage e
		pagination.current_page = e.detail
		await execQuery()
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
		<div .card>
			<div .card-body>
				<div .table-responsive>
					<Pagination data=pagination :change.changePage>
					if records.length
						<table .table>
							<thead[background-color: rgba(255,255,255,0.1)]>
								<tr>
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

	css .table
		width: 100%
		max-width: 100%

	css .table td@not(.table-action), .table th@not(.table-action)
		padding: 1rem 1.5rem
		vertical-align: top
		border-top: 1px solid rgba(255, 255, 255, .125)

	css .table th
		font-weight: 600
		border-top: 0
		border-bottom: 0

	css .table tbody tr
		transition: background-color .2s linear
		cursor: pointer

	css .table tbody tr@hover
		background-color: rgba(0,0,0,0.5)

	css .table-responsive
		display: block
		width: 100%
		overflow-x: auto
		-ms-overflow-style: -ms-autohiding-scrollbar

	css .dataTables_wrapper .table
		margin: 40px 0 20px

	css .table-action
		font-size: 1.5rem
		width: 1px
		max-height: 0px
		padding: 0.7rem 1.5rem
		vertical-align: top
		border-top: 1px solid rgba(255, 255, 255, .125)
		transition: background-color .2s linear
		transition: color .2s linear

	css .table-action@hover
		background-color: rgba(255,255,255,0.2)
		color: rgb(0,0,0)
