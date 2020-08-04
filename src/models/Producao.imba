export global class Producao < Record
	static prop table_name = 'producoes'
	static prop fields = {
		id:          {type: :String}
		created_at:  {type: :Date}
		updated_at:  {type: :Date}
	}


	static prop belongs_to = {
		lote: {type: Lote}
	}

Producao.setup()