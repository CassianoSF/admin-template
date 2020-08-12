export global class User < Model

User.setup {
	plural_name: :users
	singular_name: :user
	fields:
		id:          :string
		created_at:  :date
		updated_at:  :date
		username:    :string
		email:       :string
	inputs:
		username:        :string
		email:           :string
		password:        :string
		repeat_password: :string
}