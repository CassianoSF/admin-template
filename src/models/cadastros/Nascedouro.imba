export global class Nascedouro < Model

	get main_field
		codigo

Nascedouro.setup({
	plural_name: 'nascedouros'
	singular_name: 'nascedouro'
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