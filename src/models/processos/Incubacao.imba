export global class Incubacao < Model

	get main_field
		"LOTE {lote.codigo} - {data_incubacao}"

Incubacao.setup(
	plural_name: 'incubacoes'
	singular_name: 'incubacao'
	sync: true
	fields:
		id:                       :string
		created_at:               :date
		updated_at:               :date
		data_incubacao:           :date
		posicao:                  :string

	belongs_to:
		lote:                     :lote

	has_many:
		pacotes: :pacotes

	form:
		lote:                     :lote
		data_incubacao:           :date
		posicao:                  :string

	index:
		lote:                     :lote
		data_incubacao:           :date
		posicao:                  :string

	show:
		lote:                     :lote
		data_incubacao:           :date
		posicao:                  :string
		pacotes:                  :pacotes
)