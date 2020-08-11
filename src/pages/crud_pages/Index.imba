export default tag Index
	prop model
	prop records = []


	<self>
		<header .content__title>
			<h1> 
				<a :click=(Router.go('/'))> 'Home'
				<i[mx: 10px] .zmdi .zmdi-arrow-right>
				I18n.t.models[model.table_name].plural_name
		<div .card .fadeIn>
			<div .card-body>
				<div .table-responsive>
					<div .dataTables_wrapper .no-footer>
						if records.length
							<table .table>
								<thead [background-color: rgba(255,255,255,0.1)]>
									for own field, meta of model.index
										if model.hasRelation(field)
											<th> I18n.t.models[meta.type.table_name].human_name
										else
											<th> I18n.t.models[model.table_name].fields[field]
									<th>
									<th>
								<tbody>
									for rec in records
										<tr .main_table_tr>
											for own field, meta of model.index
												if model.hasRelation(field)
													<td @click.emit('select', rec)> rec[field].main_field
												else
													<td @click.select(rec)> rec[field]
											<td @click.emit('delete', rec) .table-action title="Excluir">
												<a .zmdi .zmdi-delete>
											<td  @click.emit('edit', rec) .table-action title="Editar">
												<a .zmdi .zmdi-edit>
						else
							<div[ta: center]> "Sem registros"

			<div .card-footer>
				<div .btn-group .card-submit>
					<button :click.emit('add') .btn .btn-success>
						<i .zmdi .zmdi-plus>
						' Adicionar' 