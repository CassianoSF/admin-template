export global class Nascimento < Model

	get main_field
		"LOTE {lote.codigo} - {data_nascimento}"

Nascimento.setup({
	plural_name: 'nascimentos'
	singular_name: 'nascimento'
	sync: true
	fields:
		id:                       :string
		created_at:               :date
		updated_at:               :date
		data_nascimento:          :date

	belongs_to:
		lote:                     :lote

	has_many:
		pacotes:                  :pacotes

	form:
		lote:                     :lote
		data_nascimento:          :date

	index:
		lote:                     :lote
		data_nascimento:          :date

	show:
		data_nascimento:          :date
		lote:                     :lote
		pacotes:                  :pacotes

	valdates:
		presense: ['lote', 'data_nascimento']

})