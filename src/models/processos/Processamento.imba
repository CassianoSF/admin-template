export global class Processamento < Record
	static prop table_name = 'processamentos'
	static prop fields = {
		id:                  {type: :String}
		created_at:          {type: :Date}
		updated_at:          {type: :Date}
		data_processamento:  {type: :Date}
		machos_de_primeira:  {type: :Integer}
		machos_de_segunda:   {type: :Integer}
		femeas_de_primeira:  {type: :Integer}
		femeas_de_segunda:   {type: :Integer}
		pintos_descartados:  {type: :Integer}
	}

	static prop belongs_to = {
		lote:                {type: Lote}
	}

	static prop has_many = {
		pacotes:             {type: :Pacote}
	}

	static prop inputs = {
		lote:                {type: Lote,      null: false}
		data_processamento:  {type: :Date,     null: false}
		machos_de_primeira:  {type: :Integer,  null: false}
		machos_de_segunda:   {type: :Integer,  null: false}
		femeas_de_primeira:  {type: :Integer,  null: false}
		femeas_de_segunda:   {type: :Integer,  null: false}
		pintos_descartados:  {type: :Integer,  null: false}
	}

	static prop index = {
		lote:                {type: Lote}
		data_processamento:  {type: :Date}
	}

	static prop show = {
		lote:                {type: Lote}
		data_processamento:  {type: :Date}
		machos_de_primeira:  {type: :Integer}
		machos_de_segunda:   {type: :Integer}
		femeas_de_primeira:  {type: :Integer}
		femeas_de_segunda:   {type: :Integer}
		pintos_descartados:  {type: :Integer}
		pacotes:             {type: :Pacote}
	}

	get main_field
		"LOTE {lote.codigo} - {data_processamento}"

Processamento.setup()