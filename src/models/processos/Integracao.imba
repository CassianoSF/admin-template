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

	static prop inputs = {
		data_nascimento:          {type: :Date}
	}

	static prop belongs_to = {
		lote:                {type: Lote}
	}

Integracao.setup()