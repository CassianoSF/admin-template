export global class Pacote < Model


Pacote.setup {
	plural_name: 'pacotes'
	singular_name: 'pacotes'
	sync: true
	fields:
		id:            :string
		created_at:    :date
		updated_at:    :date
		incompleto:    :boolean

	belongs_to:
		armazenamento: :armazenamento
		incubacao:     :incubacao
		integracao:    :integracao
		nascimento:    :nascimento
		processamento: :processamento
		recebimento:   :recebimento
		transferencia: :transferencia
		carro_inc:     :carro_inc
		incubadora:    :incubadora
		carro_nasc:    :carro_nasc
		nascedouro:    :nascedouro
		vacina_1:      :vacina
		vacina_2:      :vacina
		# integrado:     :integrado
}
