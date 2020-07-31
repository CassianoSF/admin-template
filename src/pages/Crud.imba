tag Form
	prop errors = {}
	prop target
	prop loading
		
	def fieldName field
		I18n.t.models[$context.model.table_name].fields[field]

	def close
		console.log 'close'

	def submit
		console.log target

	<self>
		<div .card .animated .fadeIn>
			<div .card-body>
				<form>

					if Object.keys(errors).len
						<div .alert .alert-danger>
							for own field, msgs of errors
								for error in msgs
									<p>
										" • {fieldName(field)} {error[0]}"
					<div .form-row>
						for own field, meta of $context.model.inputs
							<div .col-md-4>
								<div .form-group>
									<label>
										fieldName(field)
									<input bind=target[field] name=field type="text" .form-control .form-control-lg placeholder=fieldName(field)>

									if errors[field]
										<small .validation-error name="{field}-validation">
											errors[field]
			<div .card-footer style="height: 75px">
				<div .btn-group style='position: absolute; right: 20px; bottom: 20px'>
					<button type="button" .btn .btn-danger :pointerup.close>
						'Cancelar'
					<button type="button" .btn .btn-primary :pointerup.submit style='margin-left: 20px'>
						if target.id then "Salvar" else "Adicionar"
						if loading
							<i .zmdi .zmdi-spinner .zmdi-hc-spin>

export tag Crud
	prop model
	prop target

	def addRecord
		target = model.new

	def render
		<self>
			<header .content__title>
				<h1> I18n.t.models[model.table_name].plural_name

			if target
				<Form target=target>
			else				
				<div .card .animated .fadeIn>
					<div .card-body>
						<div .table-responsive>
							<div #data-table_wrapper .dataTables_wrapper .no-footer>
								<div .row>
								<div .col-md-6 .form-group>
									<button @pointerup.addRecord .btn .btn-link .button-add-record>
										<i .zmdi .zmdi-plus>
										" {I18n.t.pages.crud.add} {I18n.t.models[model.table_name].human_name}"
###
								<div .col-md-6 .search_input_col .form-group>
									<div .dataTables_filter>
										<label>
											<input[search] 
												style='background-color: rgba(0,0,0,0.5);'
												.search_input
												:keyup.searchFilter 
												type="search" 
												placeholder="Buscar {I18n.ptbr:models[model.table_name]:human_name} por {I18n.ptbr:models[model.table_name]:attributes[model.main_field]}">
							<div .row style="margin-top: 25px"> if Object.keys(model.belongs_to):length
								for own name, relation of model.belongs_to
									<div .col-md-3 .crud-filter>
										<label>
											I18n.ptbr:models[relation:type.table_name]:human_name
										if relations[name]
											<Select :change=(do |e| self["filter_{name}"](e)) 
												options=(relations[name].map do |r| r[relation:main_field]) 
												default=({name: "Todos", value: null}) 
												values=(relations[name].map do |r| r[relation:type.primary_key])> 

							if loading
								<Spinner>
							else
								<Pagination[pagination] :change.changePage>

								<Table 
									:select.selectRecord
									:sort.tableSort
									:edit.tableEdit
									:delete.tableDelete
									columns=(columns) 
									list=(records:data)
									sort=(order)
									destroy=true
									update=true
									model=model
									loading_page=loading_page>

								<Pagination[pagination] :change.changePage>
