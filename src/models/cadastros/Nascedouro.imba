export global class Nascedouro < Record
	static prop table_name = 'nascedouros'
	static prop fields = {
		id:                       {type: :String}
		created_at:               {type: :Date}
		updated_at:               {type: :Date}
		codigo:                   {type: :String}
	}

	static prop inputs = {
		codigo:                   {type: :String}
	}

	get main_field
		codigo

Nascedouro.setup()