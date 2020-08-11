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

	static prop inputs = {
		data_processamento:       {type: :Date}
		ovos_incubaveis:          {type: :Integer}
		ovos_de_risco:            {type: :Integer}
		comercio_sujo:            {type: :Integer}
		comercio_trincado:        {type: :Integer}
		comercio_gema_dupla:      {type: :Integer}
		ovos_quebrados:           {type: :Integer}
	}

	static prop belongs_to = {
		lote:                {type: Lote}
	}


Armazenamento.setup()