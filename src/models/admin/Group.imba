export global class Group < Model

	get main_field
		name

Group.setup({
	plural_name: :groups
	singular_name: :group
	fields:
		id:          :string
		created_at:  :date
		updated_at:  :date
		name:        :string
	has_many:
		permissions: :permission
	form:
		name: :string
		permissions: :permission
	index:
		name: :string
	show:
		name: :string
})