export global class Group < Model

Group.setup {
	plural_name: :groups
	singular_name: :group
	fields:
		id:          :string
		created_at:  :date
		updated_at:  :date
		name:        :string
	has_many:
		permission:  :permission
}
