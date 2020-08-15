export global class Processamento < Model

	get main_field
		"LOTE {lote.codigo} - {data_processamento}"

Processamento.setup({
	plural_name: 'processamentos'
	singular_name: 'processamento'
	sync: true
	fields:
		id:                  :string
		created_at:          :date
		updated_at:          :date
		data_processamento:  :date
		machos_de_primeira:  :integer
		machos_de_segunda:   :integer
		femeas_de_primeira:  :integer
		femeas_de_segunda:   :integer
		pintos_descartados:  :integer

	belongs_to:
		lote:                :lote

	has_many:
		pacotes:             :pacote

	form:
		lote:                :lote
		data_processamento:  :date
		machos_de_primeira:  :integer
		machos_de_segunda:   :integer
		femeas_de_primeira:  :integer
		femeas_de_segunda:   :integer
		pintos_descartados:  :integer

	index:
		lote:                :lote
		data_processamento:  :date

	show:
		lote:                :lote
		data_processamento:  :date
		machos_de_primeira:  :integer
		machos_de_segunda:   :integer
		femeas_de_primeira:  :integer
		femeas_de_segunda:   :integer
		pintos_descartados:  :integer
		pacotes:             :pacote

	valdates:
		presense: [
			'lote'
			'data_processamento'
			'machos_de_primeira'
			'machos_de_segunda'
			'femeas_de_primeira'
			'femeas_de_segunda'
			'pintos_descartados'
		]
})