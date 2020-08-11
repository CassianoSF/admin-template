export global class Pacote < Record
	static prop table_name = 'pacotes'
	static prop fields = {
		id:             {type: :String}
		created_at:     {type: :Date}
		updated_at:     {type: :Date}
		incompleto:     {type: :Boolean}
	}

	static prop belongs_to = {
		armazenamento:  {type: Armazenamento}
		incubacao:      {type: Incubacao}
		integracao:     {type: Integracao}
		nascimento:     {type: Nascimento}
		processamento:  {type: Processamento}
		recebimento:    {type: Recebimento}
		transferencia:  {type: Transferencia}
		carro_inc:      {type: CarroInc}
		incubadora:     {type: Incubadora}
		carro_nasc:     {type: CarroNasc}
		nascedouro:     {type: Nascedouro}
		vacina_1:       {type: Vacina}
		vacina_2:       {type: Vacina}
		# integrado:      {type: Integrado}
	}


Pacote.setup()