import Dayjs from "dayjs"

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

	static prop belongs_to = {
		lote: {type: Lote}
	}

	static prop has_many = {
		pacotes: {type: :Pacote}
	}

	static prop inputs = {
		lote:                     {type: Lote,     null: false}
		data_postura:             {type: :Date,    null: false}
		data_entrada:             {type: :Date,    null: false}
		total_de_ovos_enviados:   {type: :Integer, null: false}
		ovos_limpos:              {type: :Integer, null: false}
		ovos_de_cama:             {type: :Integer, null: false}
		ovos_sujos_de_ninho:      {type: :Integer, null: false}
		gema_dupla:               {type: :Integer, null: false}
		trincado:                 {type: :Integer, null: false}
		sujo_descartado:          {type: :Integer, null: false}
	}

	static prop index = {
		lote:                     {type: Lote}
		data_postura:             {type: :Date}
		data_entrada:             {type: :Date}
		total_de_ovos_enviados:   {type: :Integer}
	}

	static prop show = {
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

	get main_field
		"LOTE {lote.codigo} - {data_entrada}"

Recebimento.setup()




