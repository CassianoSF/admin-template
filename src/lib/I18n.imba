export global class I18n
	static prop pt_br = {
		select: "Selecione"
		validation_error:
			not_null: " não pode estar vazio"
		sidebar:
			profile: "Perfil"
			change_password: "Alterar Senha"
			logout: "Sair"
		pages:
			crud:
				add: 'Adicionar'
				new: 'Novo'
				edit: 'Editar'
				save: 'Salvar'
				cancel: 'Cancelar'
				success: 'Salvo com sucesso!'
				error: 'Registro inválido!'
				confirm: 'Tem certeza que deseja excluir?'
				success_destroy: 'Excluido com sucesso!'
		models:
			users:
				human_name: 'Usuário'
				plural_name: 'Usuários'
				fields: 
					name: 'Nome'
					email: 'Email'
					password: 'Senha'
					repeat_password: 'Repita a senha'
			producoes:
				human_name: 'Produção'
				plural_name: 'Produções'
				fields: 
					lote: 'Lote'
			armazenamentos:
				human_name: 'Armazenamento'
				plural_name: 'Armazenamentos'
				fields:
					data_processamento: 'Data de Processamento'
					ovos_incubaveis: 'Ovos Incubáveis'
					ovos_de_risco: 'Ovos De Risco'
					comercio_sujo: 'Comercio Sujo'
					comercio_trincado: 'Comercio Trincado'
					comercio_gema_dupla: 'Comercio Gema Dupla'
					ovos_quebrados: 'Ovos Quebrados'
			incubacoes:
				human_name: 'Incubação'
				plural_name: 'Incubações'
				fields:
					data_incubacao: 'Data de Incubação'
					posicao: 'Posição'
			integracoes:
				human_name: 'Integração'
				plural_name: 'Integrações'
				fields:
					quantidade_pintos: 'Quantidade Pintos'
					sexo_pinto: 'Sexo Pinto'
					data_saida: 'Data de Saída'
			nascimentos:
				human_name: 'Nascimento'
				plural_name: 'Nascimentos'
				fields:
					data_nascimento: 'Data de nascimento'
			processamentos:
				human_name: 'Processamento'
				plural_name: 'Processamentos'
				fields:
					data_processamento: 'Data Processamento'
					machos_de_primeira: 'Machos de Primeira'
					machos_de_segunda: 'Machos de Segunda'
					femeas_de_primeira: 'Femeas de Primeira'
					femeas_de_segunda: 'Femeas de Segunda'
					pintos_descartados: 'Pintos de scartados'
			recebimentos:
				human_name: 'Recebimento'
				plural_name: 'Recebimentos'
				fields:
					lote: 'Lote'
					data_postura: 'Data Postura'
					data_entrada: 'Data Entrada'
					total_de_ovos_enviados: 'Total de Ovos Enviados'
					ovos_limpos: 'Ovos Limpos'
					ovos_de_cama: 'Ovos de Cama'
					ovos_sujos_de_ninho: 'Ovos Sujos de Ninho'
					gema_dupla: 'Gema Dupla'
					trincado: 'Trincado'
					sujo_descartado: 'Sujo Descartado'
			transferencias:
				human_name: 'Transferência'
				plural_name: 'Transferências'
				fields:
					data_transferencia: 'Data de Transferência'
					ovos_claros_removidos: 'Ovos Claros Removidos'

			lotes:
				human_name: 'Lote'
				plural_name: 'Lotes'
				fields:
					codigo: 'Código'

			nucleos:
				human_name: 'Núcleo'
				plural_name: 'Núcleos'
				fields:
					codigo: 'Código'

			granjas:
				human_name: 'Granja'
				plural_name: 'Granjas'
				fields:
					codigo: 'Código'

			nascedouros:
				human_name: 'Nascedouro'
				plural_name: 'Nascedouros'
				fields:
					codigo: 'Código'

			incubadoras:
				human_name: 'Incubadora'
				plural_name: 'Incubadoras'
				fields:
					codigo: 'Código'

			carros_inc:
				human_name: 'Carro de Incubação'
				plural_name: 'Carros de Incubação'
				fields:
					codigo: 'Código'

			carros_nasc:
				human_name: 'Carro de Nascimento'
				plural_name: 'Carros de Nascimento'
				fields:
					codigo: 'Código'

	}

	static prop en_us = {
		sidebar:
			profile: "Profile"
			change_password: "Change Password"
			logout: "Logout"
		pages:
			crud:
				add: 'Add'
				new: 'New'
				save: 'Save'
				cancel: 'Cancel'

		models:
			users:
				human_name: 'User'
				plural_name: 'Users'
				fields: 
					id: 'ID'
					name: 'Name'
					email: 'Email'
					repeat_password: 'Repeat password'
	}

	static prop t

	static def init reg
		t = self[reg] or en_us

