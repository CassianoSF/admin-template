export global class Recebimento < Model
	get main_field
		"LOTE {lote.codigo} - {data_entrada}"

Recebimento.setup({
	plural_name: 'recebimentos'
	singular_name: 'recebimento'
	sync: true
	fields: 
		id:                       :string
		created_at:               :date
		updated_at:               :date
		data_postura:             :date
		data_entrada:             :date
		total_de_ovos_enviados:   :integer
		ovos_limpos:              :integer
		ovos_de_cama:             :integer
		ovos_sujos_de_ninho:      :integer
		gema_dupla:               :integer
		trincado:                 :integer
		sujo_descartado:          :integer

	belongs_to:
		lote: :lote

	has_many:
		pacotes: :pacote

	form:
		lote:                     :lote
		data_postura:             :date
		data_entrada:             :date
		total_de_ovos_enviados:   :integer
		ovos_limpos:              :integer
		ovos_de_cama:             :integer
		ovos_sujos_de_ninho:      :integer
		gema_dupla:               :integer
		trincado:                 :integer
		sujo_descartado:          :integer

	index:
		lote:                     :lote
		data_postura:             :date
		data_entrada:             :date
		total_de_ovos_enviados:   :integer

	show:
		lote:                     :lote
		data_postura:             :date
		data_entrada:             :date
		total_de_ovos_enviados:   :integer
		ovos_limpos:              :integer
		ovos_de_cama:             :integer
		ovos_sujos_de_ninho:      :integer
		gema_dupla:               :integer
		trincado:                 :integer
		sujo_descartado:          :integer

	validates:
		presense: [
			'lote'
			'data_postura'
			'data_entrada'
			'total_de_ovos_enviados'
			'ovos_limpos'
			'ovos_de_cama'
			'ovos_sujos_de_ninho'
			'gema_dupla'
			'trincado'
			'sujo_descartado'
		]
})