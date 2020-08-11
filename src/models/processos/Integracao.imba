export global class Integracao < Record
	static prop table_name = 'integracoes'
	static prop fields = {
		id:                       {type: :String}
		created_at:               {type: :Date}
		updated_at:               {type: :Date}
		quantidade_pintos:        {type: :Integer}
		sexo_pinto:               {type: :String}
		data_saida:               {type: :Date}
	}

	static prop belongs_to = {
		lote:                     {type: Lote}
	}

	static prop has_many = {
		pacotes: {type: :Pacotes}
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
		lote:                     {type: Lote}
		data_nascimento:          {type: :Date}
		quantidade_pintos:        {type: :Integer}
		sexo_pinto:               {type: :String}
		data_saida:               {type: :Date}
		pacotes:                  {type: :Pacotes}
	}

	get main_field
		"LOTE {lote.codigo} - {data_nascimento}"

Integracao.setup()