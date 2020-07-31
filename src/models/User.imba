export global class User < Record
	static prop table_name = 'users'
	static prop fields = {
		id:          {type: :String}
		created_at:  {type: :Date}
		updated_at:  {type: :Date}
		name:        {type: :String}
		email:       {type: :String}
	}

	static prop inputs = {
		name:  {type: :String}
		email: {type: :String}
	}


User.setup()

console.log User.new