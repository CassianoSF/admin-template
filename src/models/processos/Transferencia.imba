export global class Transferencia < Record
	static prop table_name = 'transferencias'
	static prop fields = {
		id:                       {type: :String}
		created_at:               {type: :Date}
		updated_at:               {type: :Date}
		data_transferencia:      {type: :Date}
		ovos_claros_removidos:   {type: :Integer}
	}

	static prop inputs = {
		data_transferencia:      {type: :Date}
		ovos_claros_removidos:   {type: :Integer}
	}

	static prop belongs_to = {
		lote:                {type: Lote}
	}

Transferencia.setup()