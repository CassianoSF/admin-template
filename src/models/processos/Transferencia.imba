export global class Transferencia < Record
	static prop table_name = 'transferencias'
	static prop fields = {
		id:                       {type: :String}
		created_at:               {type: :Date}
		updated_at:               {type: :Date}
		data_transferencia:       {type: :Date}
		ovos_claros_removidos:    {type: :Integer}
	}

	static prop belongs_to = {
		lote:                     {type: Lote}
	}

	static prop has_manu = {
		pacotes:                  {type: :Pacote}
	}

	static prop inputs = {
		lote:                     {type: Lote,     null: false}
		data_transferencia:       {type: :Date,    null: false}
		ovos_claros_removidos:    {type: :Integer, null: false}
	}

	static prop index = {
		lote:                     {type: Lote}
		data_transferencia:       {type: :Date}
		ovos_claros_removidos:    {type: :Integer}
	}

	static prop show = {
		lote:                     {type: Lote}
		data_transferencia:       {type: :Date}
		ovos_claros_removidos:    {type: :Integer}
		pacotes:                  {type: :Pacote}
	}

	get main_field
		"LOTE {lote.codigo} - {data_transferencia}"

Transferencia.setup()