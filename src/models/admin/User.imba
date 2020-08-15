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
	belongs_to:
		group: :group
	form:
		username:        :string
		email:           :string
		password:        :string
		repeat_password: :string
		group:           :group
	index:
		username:        :string
		email:           :string
		group:           :group
	show:
		username:        :string
		email:           :string
		group:           :group

	validates:
		presence: [
			'username'
			'email'
			'password'
			'repeat_password'
			'group'
		]
}