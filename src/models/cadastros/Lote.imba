export global class Lote < Model

	get main_field
		codigo

Lote.setup({
	plural_name: 'lotes'
	singular_name: 'lote'
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