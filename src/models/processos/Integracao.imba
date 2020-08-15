export global class Integracao < Model

	get main_field
		"LOTE {lote.codigo} - {data_nascimento}"

Integracao.setup({
	plural_name: 'integracoes'
	singular_name: 'integracao'
	sync: true
	fields:
		id:                       :string
		created_at:               :date
		updated_at:               :date
		quantidade_pintos:        :integer
		sexo_pinto:               :string
		data_saida:               :date

	belongs_to:
		lote:                     :lote

	has_many:
		pacotes: :pacotes

	form:
		lote:                     :lote
		data_nascimento:          :date

	index:
		lote:                     :lote
		data_nascimento:          :date

	show:
		lote:                     :lote
		data_nascimento:          :date
		quantidade_pintos:        :integer
		sexo_pinto:               :string
		data_saida:               :date
		pacotes:                  :pacotes

	validates:
		presense: ['lote', 'data_nascimento']

})