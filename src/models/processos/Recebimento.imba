export global class Recebimento < Record
	static prop table_name = 'recebimentos'
	static prop fields = {
		id:                       {type: :String}
		created_at:               {type: :Date}
		updated_at:               {type: :Date}

		data_postura:             {type: :Date}
		data_entrada:             {type: :Date}
		total_de_ovos_enviados:   {type: :Integer}
		ovos_limpos:              {type: :Integer}
		ovos_de_cama:             {type: :Integer}
		ovos_sujos_de_ninho:      {type: :Integer}
		gema_dupla:               {type: :Integer}
		trincado:                 {type: :Integer}
		sujo_descartado:          {type: :Integer}
	}

	static prop inputs = {
		lote:                     {type: Lote}
		data_postura:             {type: :Date}
		data_entrada:             {type: :Date}
		total_de_ovos_enviados:   {type: :Integer}
		ovos_limpos:              {type: :Integer}
		ovos_de_cama:             {type: :Integer}
		ovos_sujos_de_ninho:      {type: :Integer}
		gema_dupla:               {type: :Integer}
		trincado:                 {type: :Integer}
		sujo_descartado:          {type: :Integer}
	}

	static prop belongs_to = {
		producao:                {type: Producao}
	}

Recebimento.setup()




