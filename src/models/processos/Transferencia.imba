export global class Transferencia < Model
	get main_field
		"LOTE {lote.codigo} - {data_transferencia}"

Transferencia.setup {
	plural_name: 'transferencias'
	singular_name: 'transferencia'
	sync: true
	fields:
		id:                       :string
		created_at:               :date
		updated_at:               :date
		data_transferencia:       :date
		ovos_claros_removidos:    :integer

	belongs_to:
		lote: :lote

	has_many:
		pacotes: :pacotes

	form: 
		lote:                     :lote
		data_transferencia:       :date
		ovos_claros_removidos:    :integer
		pacotes:                  :pacote

	index:
		lote:                     :lote
		data_transferencia:       :date
		ovos_claros_removidos:    :integer

	show:
		lote:                     :lote
		data_transferencia:       :date
		ovos_claros_removidos:    :integer
		pacotes:                  :pacote
}