export global class Deleted < Model

Deleted.setup({
	plural_name: 'deleteds'
	singular_name: 'deleted'
	sync: true
	fields:
		id:         :string
		created_at: :date
		updated_at: :date
		model:      :string
		rec_id:     :integer
})