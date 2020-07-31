export tag Sidebar
	prop menu_items = [
			{ 
				url: '/'
				icon: "zmdi-chart"
				title: " Dashboard"
			},{ 
				url: '/users'
				icon: "zmdi-accounts"
				title: " Users"
				acesso: :users
			},{ 
				url: '/visao-geral'
				icon: "zmdi-view-dashboard"
				title: " Visão geral"
				acesso: :visao_geral
			},{
				url: '/cadastros'
				icon: "zmdi-view-headline"
				title: " Cadastros"
				open: no
				sub_menus: [
					{ 
						url: '/propriedades'
						icon: "zmdi-home"
						title: " Propriedades"
						acesso: :locais
					},{ 
						url: '/empresas'
						icon: "zmdi-city"
						title: " Empresas e Unidades"
						acesso: :empresas
					},{ 
						url: '/silos'
						icon: "zmdi-panorama-vertical"
						title: " Silos"
						acesso: :silos
					},{ 
						url: '/rotas'
						icon: "zmdi-navigation"
						title: " Linhas"
						acesso: :linhas
					}
				]
			},{
				url: '/administrativo'
				icon: "zmdi-view-headline"
				title: " Administrativo"
				open: no
				sub_menus: [
					{ 
						url: '/milkspecs'
						icon: "zmdi-usb"
						title: " Milkspecs"
						acesso: :maquinas
					},{ 
						url: '/origens'
						icon: "zmdi-pin"
						title: " Origens"
						acesso: :origens
					},{ 
						url: '/usuarios'
						icon: "zmdi-account-circle"
						title: " Usuários"
						acesso: :usuarios
					},{ 
						url: '/grupos'
						icon: "zmdi-accounts"
						title: " Grupos"
						acesso: :grupos
					},{ 
						url: '/padroes'
						icon: "zmdi-tune"
						title: " Padrões de Qualidade"
						acesso: :grupos
					}
				]
			},{ 
				url: '/relatorios'
				icon: "zmdi-chart"
				title: " Relatórios"
			}, 
		]

	def mount
		window.addEventListener('popstate') do |e|
			for item in menu_items
				let submenus = (item.sub_menus or []).map do |i| i.url
				if submenus.includes($context.router.current)
					item.open = true
				else
					item.open = false

	def change_page page
		$context.router.go(page)

	def logout
		$context.session.logout()
		$context.router.go('/login')

	def isSelected item
		item.url == $context.router.current

	def close
		state.toggled = false

	def selectItem item
		if item.sub_menus
			item.open = !item.open
			render()
		else
			change_page(item.url)

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
					for item in menu_items
						<li .navigation_sub 
							.navigation__active=(isSelected(item)) 
							.navigation__sub--active=(isSelected(item)) 
							.nav-item__disabled=(item.disabled)
							.nav-item__warning=(item.warning)
						>
							<a @pointerup.selectItem(item)>
								if item.image
									<img .zmdi src=item.image.src height=item.image.size style="margin-right: 10px;">
								else
									<i .zmdi .{item.icon}>
								item.title
							if item.open
								<ul .navigation .animated .fadeIn style="margin-left: 20px"> 
									for sub_item in item.sub_menus
										<li @pointerup.selectItem(sub_item) .navigation_sub .navigation__active=(isSelected(sub_item))>
											<a> 
												if sub_item.image
													<img .zmdi src=sub_item.image.src height=sub_item.image.size style="margin-right: 10px;">
												else
													<i .zmdi .{sub_item.icon}>
												sub_item.title
