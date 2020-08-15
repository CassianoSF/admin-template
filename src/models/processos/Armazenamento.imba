export global class Armazenamento < Model
	get main_field
		"LOTE {lote.codigo} - {data_processamento}"

Armazenamento.setup({
	plural_name: 'armazenamentos'
	singular_name: 'armazenamento'
	sync: true
	fields:
		id:                       :string
		created_at:               :date
		updated_at:               :date
		data_processamento:       :date
		ovos_incubaveis:          :integer
		ovos_de_risco:            :integer
		comercio_sujo:            :integer
		comercio_trincado:        :integer
		comercio_gema_dupla:      :integer
		ovos_quebrados:           :integer

	belongs_to:
		lote: :lote

	has_many:
		pacotes: :pacotes

	form:
		lote:                     :lote
		data_processamento:       :date
		ovos_incubaveis:          :integer
		ovos_de_risco:            :integer
		comercio_sujo:            :integer
		comercio_trincado:        :integer
		comercio_gema_dupla:      :integer
		ovos_quebrados:           :integer

	index:
		lote:                     :lote
		data_processamento:       :date
		ovos_incubaveis:          :integer

	show:
		lote:                     :lote
		data_processamento:       :date
		ovos_incubaveis:          :integer
		ovos_de_risco:            :integer
		comercio_sujo:            :integer
		comercio_trincado:        :integer
		comercio_gema_dupla:      :integer
		ovos_quebrados:           :integer
		pacotes:                  :pacotes

	validates:
		presence: [
			'lote'
			'data_processamento'
			'ovos_incubaveis'
			'ovos_de_risco'
			'comercio_sujo'
			'comercio_trincado'
			'comercio_gema_dupla'
			'ovos_quebrados'
		]
})