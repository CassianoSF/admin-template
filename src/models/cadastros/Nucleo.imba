export global class Nucleo < Record
	static prop table_name = 'nucleos'	 
	static prop fields = {
		id:                       {type: :String}
		created_at:               {type: :Date}
		updated_at:               {type: :Date}
		codigo:                   {type: :String}
	}

	static prop belongs_to = {
		granja: {type: Granja}
	}

	static prop inputs = {
		codigo: {type: :String, null: false}
		granja: {type: Granja, null: false}
	}

	static prop index = {
		codigo:                   {type: :String}
	}

	get main_field
		codigo

Nucleo.setup()