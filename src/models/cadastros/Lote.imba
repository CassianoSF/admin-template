export global class Lote < Record
	static prop table_name = 'lotes'
	static prop fields = {
		id:                       {type: :String}
		created_at:               {type: :Date}
		updated_at:               {type: :Date}
		ano:                      {type: :Integer}
	}

	static prop belongs_to = {
		granja: {type: Granja}
		nucleo: {type: Nucleo}
	}

	static prop inputs = {
		ano:    {type: :String, null: false}
		granja: {type: Granja,  null: false}
		nucleo: {type: Nucleo,  null: false}
	}

	static prop index = {
		main_field: {type: :String}
		ano: {type: :String}
		granja: {type: Granja}
		nucleo: {type: Nucleo}
	}

	get main_field
		"{nucleo.codigo}-{granja.codigo}{ano}"


Lote.setup()