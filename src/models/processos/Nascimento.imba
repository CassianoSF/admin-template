export global class Nascimento < Record
	static prop table_name = 'nascimentos'
	static prop fields = {
		id:                       {type: :String}
		created_at:               {type: :Date}
		updated_at:               {type: :Date}
		data_nascimento:          {type: :Date}
	}

	static prop inputs = {
		data_nascimento:          {type: :Date}
	}

	static prop belongs_to = {
		lote:                {type: Lote}
	}

Nascimento.setup()