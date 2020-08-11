export global class Nascimento < Record
	static prop table_name = 'nascimentos'
	static prop fields = {
		id:                       {type: :String}
		created_at:               {type: :Date}
		updated_at:               {type: :Date}
		data_nascimento:          {type: :Date}
	}

	static prop belongs_to = {
		lote:                     {type: Lote}
	}

	static prop has_many = {
		pacotes:                  {type: :Pacotes}
	}

	static prop inputs = {
		lote:                     {type: Lote,  null: false}
		data_nascimento:          {type: :Date, null: false}
	}

	static prop index = {
		lote:                     {type: Lote}
		data_nascimento:          {type: :Date}
	}

	static prop show = {
		data_nascimento:          {type: :Date}
		lote:                     {type: Lote}
		pacotes:                  {type: :Pacotes}
	}

	get main_field
		"LOTE {lote.codigo} - {data_nascimento}"

Nascimento.setup()