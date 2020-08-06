export global class Lote < Record
	static prop table_name = 'lotes'
	static prop fields = {
		id:                       {type: :String}
		created_at:               {type: :Date}
		updated_at:               {type: :Date}
		codigo:                   {type: :String}
	}

	static prop inputs = {
		codigo: {type: :String, null: false}
	}

	static prop index = {
		codigo: {type: :String}
	}

	get main_field
		codigo

Lote.setup()