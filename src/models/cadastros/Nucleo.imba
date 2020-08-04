export global class Nucleo < Record
	static prop table_name = 'nucleos'	 
	static prop fields = {
		id:                       {type: :String}
		created_at:               {type: :Date}
		updated_at:               {type: :Date}

		# granja:                   {type: Granja}

		codigo:                   {type: :String}
	}

	static prop inputs = {
		codigo:                   {type: :String}
	}

	static prop index = {
		codigo:                   {type: :String}
	}

	get main_field
		codigo

Nucleo.setup()