import Dayjs from "dayjs"
import Confirm from "../../components/ui/Confirm"
import Collapse from "../../components/ui/Collapse"
import Pagination from "../../components/table/Pagination"
import Select from "../../components/inputs/Select"

export default tag Index
	prop model
	prop records = []
	prop pagination = {}
	prop order
	prop reverse
	prop open_filter = false

	# def visit
	# 	execQuery()

	def mount
		pagination = {
			record_count: 0
			per_page: 50
			page_count: 0
			current_page: 0
		}
		execQuery()

	def execQuery
		pagination.record_count = await model.table.count()
		pagination.page_count = Math.ceil(pagination.record_count / 50)
		let query = model.table.orderBy(order)
		query = query.reverse() if reverse
		query = query.offset(pagination.current_page * 50).limit(50)
		let data = await query.with(model.includes)
		records = data.map do |rec| model.ormRecord(rec)
		render()

	def sortBy field
		if field == order
			reverse = !reverse
		order = field
		execQuery()

	def changePage e
		pagination.current_page = e.detail
		execQuery()

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

	def toggleFilter
		open_filter = !open_filter

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
				<div .btn-group>
					<button :click.toggleFilter .btn .btn-dark>	
						<i .zmdi .zmdi-filter-list>
						' Filtros'
					<button :click.add .btn .btn-success>
						<i .zmdi .zmdi-plus>
						' Adicionar' 
				<Filters model=model open=open_filter>
				<div .table-responsive>
					<Pagination data=pagination :change.changePage>
					if records.length
						<table .table>
							<thead[background-color: rgba(255,255,255,0.1)]>
								<tr>
									for own field, type of model.index
										if model.hasRelation(field)
											<th :click.sortBy("{field}_id")> 
												I18n.t.models[Model.models[type].class.plural_name].human_name + ' '
												if order == "{field}_id"
													<a .zmdi .zmdi-hc-lg .{reverse ? "zmdi-chevron-down" : "zmdi-chevron-up"}>

										else
											<th :click.sortBy(field)> 
												I18n.t.models[model.plural_name].fields[field] + ' '
												if order == field
													<a .zmdi .zmdi-hc-lg .{reverse ? "zmdi-chevron-down" : "zmdi-chevron-up"}>
									<th>
									<th>
							<tbody>
								for rec in records
									<tr>
										for own field, type of model.index
											if model.hasRelation(field)
												<td @click.show(rec)> rec[field].main_field or ''
											elif type == :date
												<td @click.show(rec)> Dayjs.new(rec[field] or 'Not Valid').format('DD/MM/YYYY - hh:mm')
											else
												<td @click.show(rec)> rec[field] or ''
										<td @click.delete(rec) .table-action title="Excluir">
											<a .zmdi .zmdi-delete>
										<td  @click.edit(rec) .table-action title="Editar">
											<a .zmdi .zmdi-edit>
					else
						<div[ta: center]> "Sem registros"

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


tag Filters
	prop model

	<self>
		<Collapse open=(open)>
			<hr>
			<.row>
				for own field, type of model.index
					<.col-md-2>
						<div .form-group>
							if model.hasRelation(field)
								I18n.t.models[Model.models[type].class.plural_name].human_name
							else
								I18n.t.models[model.plural_name].fields[field]
					<.col-md-5>
						<Select>
					<.col-md-5>
