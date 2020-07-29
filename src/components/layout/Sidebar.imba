export tag Sidebar
	def mount 
		menuItems = [
			{ 
				urls: ['/dashboard', '', '/']
				redirect: :dashboard
				icon: "zmdi-chart"
				title: " Dashboard"
			},{ 
				urls: ['/visao-geral']
				redirect: "visao-geral"
				icon: "zmdi-view-dashboard"
				title: " Visão geral"
				acesso: :visao_geral
			},{ 
				urls: ['/analises']
				redirect: :analises
				icon: "zmdi-format-list-bulleted"
				title: " Análises"
				acesso: :analises
			},{
				urls: ['/cadastros']
				redirect: :cadastros
				icon: "zmdi-view-headline"
				title: " Cadastros"
				open: no
				sub_menus: [
					{ 
						urls: ['/propriedades']
						redirect: :propriedades
						icon: "zmdi-home"
						title: " Propriedades"
						acesso: :locais
					},{ 
						urls: ['/animais']
						redirect: :animais
						image: 
							src:"/common/fonts/cow2.svg" 
							size: 20
						title: " Animais"
						acesso: :animais
					},{ 
						urls: ['/empresas']
						redirect: :empresas
						icon: "zmdi-city"
						title: " Empresas e Unidades"
						acesso: :empresas
					},{ 
						urls: ['/silos']
						redirect: :silos
						icon: "zmdi-panorama-vertical"
						title: " Silos"
						acesso: :silos
					},{ 
						urls: ['/rotas']
						redirect: :rotas
						icon: "zmdi-navigation"
						title: " Linhas"
						acesso: :linhas
					}
				]
			},{
				urls: ['/administrativo']
				redirect: :administrativo
				icon: "zmdi-view-headline"
				title: " Administrativo"
				open: no
				sub_menus: [
					{ 
						urls: ['/milkspecs']
						redirect: :milkspecs
						icon: "zmdi-usb"
						title: " Milkspecs"
						acesso: :maquinas
					},{ 
						urls: ['/racas']
						redirect: :racas
						image: 
							src: "/common/fonts/cow.svg" 
							size: 18
						title: " Raças"
						acesso: :racas
					},{ 
						urls: ['/origens']
						redirect: :origens
						icon: "zmdi-pin"
						title: " Origens"
						acesso: :origens
					},{ 
						urls: ['/usuarios']
						redirect: :usuarios
						icon: "zmdi-account-circle"
						title: " Usuários"
						acesso: :usuarios
					},{ 
						urls: ['/grupos']
						redirect: :grupos
						icon: "zmdi-accounts"
						title: " Grupos"
						acesso: :grupos
					},{ 
						urls: ['/padroes']
						redirect: :padroes
						icon: "zmdi-tune"
						title: " Padrões de Qualidade"
						acesso: :grupos
					}
				]
			},{ 
				urls: ['/relatorios']
				redirect: :relatorios
				icon: "zmdi-chart"
				title: " Relatórios"
			}, 
		]

	def change_page page
		$context.router.go(page)

	def logout
		$context.session.logout()
		$context.router.go('/login')

	def is_selected item
		item.urls.includes($context.router.current)

	<self>
		<div :pointerup.close .sa-backdrop> if state.toggled
		<aside .sidebar .toggled=(state.toggled)>
			<div .scrollbar-inner>

				<div .user>
					<div .user__info :pointerup.goToPerfil data-toggle="dropdown">
						<div>
							<div .user__name>
								'Session.user:client'
							<div .user__name>
								'Session.user:nome'
							<div .user__data>
								'Session.user:email'
							<div .user__data>
								'Session.user:cargo'

				<ul .navigation>
					<li>
						<a :pointerup.logout .dropdown-item>
							<i .zmdi .zmdi-mail-reply>
							"Sair"
					for item in menuItems
						<li .navigation_sub 
							.navigation__active=(is_selected(item)) 
							.navigation__sub--active=(is_selected(item)) 
							.nav-item__disabled=(item.disabled)
							.nav-item__warning=(item.warning)
						>
							<a @pointerup.select_item(item)>
								if item.image
									<img .zmdi src=item.image.src height=item.image.size style="margin-right: 10px;">
								else
									<i .zmdi .{item.icon}>
								item.title
							if item.open
								<ul .navigation .animated .fadeIn style="margin-left: 20px"> 
									for sub_item in item.sub_menus
										if podeVerMenu(sub_item.acesso) or !sub_item.acesso
											<li @pointerup.select_item(sub_item) .navigation_sub .navigation__active=(is_selected(sub_item))>
												<a> 
													if sub_item.image
														<img .zmdi src=sub_item.image.src height=sub_item.image.size style="margin-right: 10px;">
													else
														<i .zmdi .{sub_item.icon}>
													sub_item.title
