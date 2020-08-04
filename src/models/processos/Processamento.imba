export global class Processamento < Record
	static prop table_name = 'processamentos'
	static prop fields = {
		id:                       {type: :String}
		created_at:               {type: :Date}
		updated_at:               {type: :Date}

		data_processamento:  {type: :Date}
		machos_de_primeira:  {type: :Integer}
		machos_de_segunda:   {type: :Integer}
		femeas_de_primeira:  {type: :Integer}
		femeas_de_segunda:   {type: :Integer}
		pintos_descartados:  {type: :Integer}
	}

	static prop inputs = {
		data_processamento:  {type: :Date}
		machos_de_primeira:  {type: :Integer}
		machos_de_segunda:   {type: :Integer}
		femeas_de_primeira:  {type: :Integer}
		femeas_de_segunda:   {type: :Integer}
		pintos_descartados:  {type: :Integer}
	}

	static prop belongs_to = {
		producao:                {type: Producao}
	}

Processamento.setup()