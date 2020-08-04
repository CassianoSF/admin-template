export global class Incubacao < Record
	static prop table_name = 'incubacoes'
	static prop fields = {
		id:                       {type: :String}
		created_at:               {type: :Date}
		updated_at:               {type: :Date}

		data_incubacao:           {type: :Date}
		posicao:                  {type: :String}
	}

	static prop inputs = {
		data_incubacao:           {type: :Date}
		posicao:                  {type: :String}
	}

	static prop belongs_to = {
		producao:                {type: Producao}
	}

Incubacao.setup()