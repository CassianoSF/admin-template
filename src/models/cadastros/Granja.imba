export global class Granja < Record
	static prop table_name = 'granjas'
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

Granja.setup()