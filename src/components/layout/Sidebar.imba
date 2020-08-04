export tag Sidebar
	prop menu_items = [
			{ 
				url: '/home'
				icon: "zmdi-chart"
				title: " Home"
			},{ 
				url: '/producoes'
				icon: "zmdi-view-dashboard"
				title: " Produções"
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
				sub_menus: [
					{ 
						url: '/lotes'
						icon: "zmdi-home"
						title: " Lotes"
					},{ 
						url: '/nucleos-granjas'
						icon: "zmdi-home"
						title: " Núcleos e Granjas"
					},{ 
						url: '/incubadoras'
						icon: "zmdi-city"
						title: " Incubadoras"
					},{ 
						url: '/nascedouros'
						icon: "zmdi-panorama-vertical"
						title: " Nascedouros"
					},{ 
						url: '/linhagens'
						icon: "zmdi-panorama-vertical"
						title: " Linhagens"
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
					},{ 
						url: '/padroes'
						icon: "zmdi-tune"
						title: " Padrões de Qualidade"
					}
				]
			},{ 
				url: '/atividade'
				icon: "zmdi-chart"
				title: " Atividade"
			},{ 
				url: '/'
				icon: "zmdi-chart"
				title: " Components"
			}, 
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