export global class Vacina < Record
	static prop table_name = 'vacinas'
	static prop fields = {
		id:                       {type: :String}
		created_at:               {type: :Date}
		updated_at:               {type: :Date}
		codigo:                   {type: :String}
		descricao:                {type: :String}
	}

	static prop inputs = {
		codigo:                   {type: :String, null: false}
		descricao:                {type: :String}
	}

	static prop index = {
		codigo:                   {type: :String}
	}

	static prop show = {
		codigo:                   {type: :String}
		descricao:                {type: :String}
	}

	get main_field
		codigo

Vacina.setup()