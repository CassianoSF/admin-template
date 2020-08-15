export global class Vacina < Model
	get main_field
		codigo

Vacina.setup({
	plural_name: 'vacinas'
	singular_name: 'vacina'
	fields:
		id:                       :string
		created_at:               :date
		updated_at:               :date
		codigo:                   :string
		descricao:                :string

	form:
		codigo:                   :string
		descricao:                :string

	index:
		codigo:                   :string

	show:
		codigo:                   :string
		descricao:                :string

	validates:
		presence: ['codigo', 'descricao']
})