export global class Incubacao < Record
	static prop table_name = 'incubacoes'
	static prop fields = {
		id:                       {type: :String}
		created_at:               {type: :Date}
		updated_at:               {type: :Date}
		data_incubacao:           {type: :Date}
		posicao:                  {type: :String}
	}

	static prop belongs_to = {
		lote:                     {type: Lote}
	}

	static prop has_many = {
		pacotes: {type: :Pacotes}
	}

	static prop inputs = {
		lote:                     {type: Lote,    null: false}
		data_incubacao:           {type: :Date,   null: false}
		posicao:                  {type: :String, null: false}
	}

	static prop index = {
		lote:                     {type: Lote}
		data_incubacao:           {type: :Date}
		posicao:                  {type: :String}	
	}

	static prop show = {
		lote:                     {type: Lote}
		data_incubacao:           {type: :Date}
		posicao:                  {type: :String}	
		pacotes: {type: :Pacotes}
	}

	get main_field
		"LOTE {lote.codigo} - {data_incubacao}"

Incubacao.setup()