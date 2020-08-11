export global class Armazenamento < Record
	static prop table_name = 'armazenamentos'
	static prop fields = {
		id:                       {type: :String}
		created_at:               {type: :Date}
		updated_at:               {type: :Date}
		data_processamento:       {type: :Date}
		ovos_incubaveis:          {type: :Integer}
		ovos_de_risco:            {type: :Integer}
		comercio_sujo:            {type: :Integer}
		comercio_trincado:        {type: :Integer}
		comercio_gema_dupla:      {type: :Integer}
		ovos_quebrados:           {type: :Integer}
	}

	static prop belongs_to = {
		lote: {type: Lote}
	}

	static prop has_many = {
		pacotes: {type: :Pacotes}
	}

	static prop inputs = {
		lote:                     {type: Lote,     null: false}
		data_processamento:       {type: :Date,    null: false}
		ovos_incubaveis:          {type: :Integer, null: false}
		ovos_de_risco:            {type: :Integer, null: false}
		comercio_sujo:            {type: :Integer, null: false}
		comercio_trincado:        {type: :Integer, null: false}
		comercio_gema_dupla:      {type: :Integer, null: false}
		ovos_quebrados:           {type: :Integer, null: false}
	}

	static prop index = {
		lote:                     {type: Lote}
		data_processamento:       {type: :Date}
		ovos_incubaveis:          {type: :Integer}
	}

	static prop show = {
		lote:                     {type: Lote}
		data_processamento:       {type: :Date}
		ovos_incubaveis:          {type: :Integer}
		ovos_de_risco:            {type: :Integer}
		comercio_sujo:            {type: :Integer}
		comercio_trincado:        {type: :Integer}
		comercio_gema_dupla:      {type: :Integer}
		ovos_quebrados:           {type: :Integer}
		pacotes:                  {type: :Pacotes}
	}

	get main_field
		"LOTE {lote.codigo} - {data_processamento}"



Armazenamento.setup()