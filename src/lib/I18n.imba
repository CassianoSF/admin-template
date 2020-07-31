export global class I18n
	static prop pt_br = {
		pages:
			crud:
				add: 'Criar'
		models:
			users:
				human_name: 'Usuário'
				plural_name: 'Usuários'
				fields: 
					id: 'ID'
					name: 'Nome'
					email: 'Email'
	}

	static prop en_us = {
		pages:
			crud:
				add: 'Add'
		models:
			users:
				human_name: 'User'
				plural_name: 'Users'
				fields: 
					id: 'ID'
					name: 'Name'
					email: 'Email'
	}

	static prop t

	static def init reg
		t = self[reg] or en_us

