export global class CarroInc < Model

	get main_field
		codigo

CarroInc.setup(
	plural_name: 'carros_inc'
	singular_name: 'carro_inc'
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
)
