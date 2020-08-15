export global class Incubadora < Model

	get main_field
		codigo

Incubadora.setup({
	plural_name: 'incubadoras'
	singular_name: 'incubadora'
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