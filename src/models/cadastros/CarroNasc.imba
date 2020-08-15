export global class CarroNasc < Model

	get main_field
		codigo

CarroNasc.setup({
	plural_name: 'carros_nasc'
	singular_name: 'carro_nasc'
	fields:
		id:                       :string
		created_at:               :date
		updated_at:               :date
		codigo:                   :string

	form:
		codigo: :string

	index:
		codigo: :string

	show:
		codigo: :string

	validates:
		presence: ['codigo']
})