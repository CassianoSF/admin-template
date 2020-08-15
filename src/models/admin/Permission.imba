export global class Permission < Model

Permission.setup({
	plural_name: :permissions
	singular_name: :permission
	fields:
		id:          :string
		created_at:  :date
		updated_at:  :date
		model:       :string
		see:         :boolean
		add:         :boolean
		edit:        :boolean
		remove:      :boolean
		access:      :boolean
	belongs_to:
		group: :group
})
