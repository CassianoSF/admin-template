export tag Sidebar
	prop menu_items = [
		{ 
			url: '/'
			icon: "zmdi-chart"
			title: " Home"
		},{ 
			url: '/lote'
			icon: "zmdi-view-dashboard"
			title: " Lotes"
		},{
			url: '/processos'
			icon: "zmdi-view-headline"
			title: " Processos"
			open: no
			sub_menus: [
				{ 
					url: '/recebimento'
					icon: "zmdi-view-dashboard"
					title: " Recebimento"
				},{ 
					url: '/armazenamento'
					icon: "zmdi-view-dashboard"
					title: " Armazenamento"
				},{ 
					url: '/incubacao'
					icon: "zmdi-view-dashboard"
					title: " Incubação"
				},{ 
					url: '/transferencia'
					icon: "zmdi-view-dashboard"
					title: " Transferência"
				},{ 
					url: '/nascimento'
					icon: "zmdi-view-dashboard"
					title: " Nascimento"
				},{ 
					url: '/processamento'
					icon: "zmdi-view-dashboard"
					title: " Processamento"
				},{ 
					url: '/integracao'
					icon: "zmdi-view-dashboard"
					title: " Integração"
				}
			]
		},{
			url: '/cadastros'
			icon: "zmdi-view-headline"
			title: " Cadastros"
			open: no
			sub_menus: [{ 
					url: '/incubadora'
					icon: "zmdi-city"
					title: " Incubadoras"
				},{ 
					url: '/carro_inc'
					icon: "zmdi-city"
					title: " Carros de Incubação"
				},{ 
					url: '/nascedouro'
					icon: "zmdi-panorama-vertical"
					title: " Nascedouros"
				},{ 
					url: '/carro_nasc'
					icon: "zmdi-city"
					title: " Carros de Nascimento"
				},{ 
					url: '/linhagem'
					icon: "zmdi-panorama-vertical"
					title: " Linhagens"
				},{ 
					url: '/integrado'
					icon: "zmdi-panorama-vertical"
					title: " Integrados"
				}
			]
		},{
			url: '/administrativo'
			icon: "zmdi-view-headline"
			title: " Administrativo"
			open: no
			sub_menus: [{ 
					url: '/usuarios'
					icon: "zmdi-account-circle"
					title: " Usuários"
				},{ 
					url: '/grupos'
					icon: "zmdi-accounts"
					title: " Grupos"
				}
			]
		},{ 
			url: '/atividade'
			icon: "zmdi-chart"
			title: " Atividade"
		}
	]

	def mount
		window.addEventListener('popstate') do |e|
			for item in menu_items
				let submenus = (item.sub_menus or []).map do |i| i.url
				if submenus.includes(Router.current)
					item.open = true
				else
					item.open = false

	def change_page page
		Router.go(page)

	def logout
		Api.logout()
		Router.go('/login')

	def isSelected item
		item.url == Router.current

	def close
		STATE.sidebar.toggled = false

	def selectItem item
		if item.sub_menus
			item.open = !item.open
			render()
		else
			change_page(item.url)

	def toggleActions
		actions = !actions

	def profile
		console.log 'profile'

	def change_password
		console.log 'change_password'

	def logout
		Api.logout()
		Router.go('/login')

	<self>
		<div :click.close .sa-backdrop> if STATE.sidebar.toggled
		<aside .sidebar .toggled=(STATE.sidebar.toggled)>
			<div .scrollbar-inner>

				<div .user>
					<div .user__info :click.toggleActions data-toggle="dropdown">
						<div>
							<div .user__name>
								STATE.user.username
							<div .user__name>
								STATE.user.email
					if actions
						<div[top: 65px] .dropdown-menu .show >
							<a .dropdown-item @click.profile>
								I18n.t.sidebar.profile
							<a .dropdown-item @click.change_password>
								I18n.t.sidebar.change_password
							<a .dropdown-item @click.logout>
								I18n.t.sidebar.logout

				<ul .navigation>
					for item in menu_items
						<li .navigation_sub 
							.navigation__active=(isSelected(item)) 
							.navigation__sub--active=(isSelected(item)) 
							.nav-item__disabled=(item.disabled)
							.nav-item__warning=(item.warning)
						>
							<a @click.selectItem(item)>
								if item.image
									<img .zmdi src=item.image.src height=item.image.size style="margin-right: 10px;">
								else
									<i .zmdi .{item.icon}>
								item.title
							if item.open
								<ul .navigation .animated .fadeIn style="margin-left: 20px"> 
									for sub_item in item.sub_menus
										<li @click.selectItem(sub_item) .navigation_sub .navigation__active=(isSelected(sub_item))>
											<a> 
												if sub_item.image
													<img .zmdi src=sub_item.image.src height=sub_item.image.size style="margin-right: 10px;">
												else
													<i .zmdi .{sub_item.icon}>
												sub_item.title