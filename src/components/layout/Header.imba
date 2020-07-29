export tag Header
	def mount
		minimized_sidebar = no
		window.addEventListener('scroll', do render())

	def unmount
		window.removeEventListener('scroll', do render())

	def toggleSidebar
		$context.state.sidebar.toggled = !$context.state.sidebar.toggled

	def toggleSearch
		search_toggled = !search_toggled
		search_input.focus() if search_toggled and search_input

	def focusSearch
		search_focus = true

	def blurSearch
		search_focus = false
		if search_toggled
			search_toggled = false

	<self>
		<header .header .header--scrolled=(window.scrollY)>
			<.navigation-trigger .hidden-xl-up @click.toggleSidebar>
				<i .zmdi .zmdi-menu>
			<.logo .hidden-sm-down>
				<img src='/img/logo.svg'>
			<form .search .search--focus=search_focus .search--toggled=search_toggled>
				<div .search__inner>
					search_input = <input @focus.focusSearch @blur.blurSearch type="text" .search__text placeholder="Search for people, files, documents...">
					<i .zmdi .search__helper .zmdi-search=!search_focus .zmdi-long-arrow-right=search_focus>
			<ul .top-nav>
				<li .hidden-xl-up>
					<a :pointerup.toggleSearch>
						<i .zmdi .zmdi-search>
				<li .dropdown>
					<a data-toggle="dropdown" .top-nav__notify>
						<i .zmdi .zmdi-email>
				<li .dropdown>
					<a data-toggle="dropdown" .top-nav__notify>
						<i .zmdi .zmdi-email>
				<li .dropdown>
					<a data-toggle="dropdown" .top-nav__notify>
						<i .zmdi .zmdi-email>
				<li .dropdown>
					<a data-toggle="dropdown" .top-nav__notify>
						<i .zmdi .zmdi-email>

	css .header
		position: fixed 
		height: 72px
		width: 100vw
		z-index: 101
		color: #fff
		display: flex
		-ms-flex-align: center
		align-items: center
		padding-right: 1.5rem
		transition: background-color 1s, box-shadow 1s
		box-shadow: 0 0 13px rgba(0, 0, 0, .22)

	css .header--scrolled
		box-shadow: 0 0 13px rgba(0, 0, 0, .22)

	css .search--toggled 
		box-shadow: 0 0 13px rgba(0, 0, 0, .22)

	css .header--scrolled .search__text
		background-color: rgba(255, 255, 255, .1) @focus: rgba(255, 255, 255, .12)

	css .logo
		height: 72px
		display: -webkit-box
		display: -ms-flexbox
		display: flex
		-webkit-box-align: center
		-ms-flex-align: center
		align-items: center
		padding-left@lt-xl: 1rem
		min-width@xl: 250px
		img
			margin: auto
			height: 12

	css .navigation-trigger
		height: 100%
		width: 70px
		display: flex
		-ms-flex-align: center
		align-items: center
		-webkit-box-pack: end
		-ms-flex-pack: end
		justify-content: flex-end
		font-size: 1.65rem
		transition: opacity .1s
		cursor: pointer
		opacity: .8 @hover: 1
		background-color@hover: rgba(0,0,0,0.8)
		i
			margin: auto

	css .search--focus .search__helper
		-webkit-transform: rotate(180deg)
		transform: rotate(180deg)
		line-height: 2.9rem
		@lg
			color: rgba(255, 255, 255, .85)

	css .search__helper
		position: absolute
		left: 0
		top: 0
		font-size: 1.3rem
		height: 100%
		width: 3rem
		text-align: center
		line-height: 2.9rem
		cursor: pointer
		transition: color .3s, -webkit-transform .4s
		transition: color .3s, transform .4s
		transition: color .3s, transform .4s, -webkit-transform .4s

	css .search__text
		border: 0
		border-radius: 2px
		height: 2.9rem
		padding-left: 3rem
		width: 100%
		transition: background-color .3s, color .3s
		color: rgba(255, 255, 255) 
		@lg
			background-color: rgba(255, 255, 255, .08) @focus: rgba(255, 255, 255, .2)
			color: rgba(255, 255, 255, .85) @placeholder: rgba(255, 255, 255, .85)

	css .search
		-webkit-box-flex: 1
		-ms-flex: 1
		flex: 1
		margin-right: 2.5rem
		position: relative
		@lt-xl
			padding: 0 1.5rem
			position: absolute
			left: 0
			top: 0
			height: 100%
			width: 100%
			z-index: 101
			display: -webkit-box
			display: -ms-flexbox
			display: flex
			-webkit-box-align: center
			-ms-flex-align: center
			align-items: center
			transition: box-shadow .3s, background-color .3s, -webkit-transform .3s
			transition: transform .3s, box-shadow .3s, background-color .3s
			transition: transform .3s, box-shadow .3s, background-color .3s, -webkit-transform .3s
			@not(.search--toggled)
				-webkit-transform: translate3d(0, -105%, 0)
				transform: translate3d(0, -105%, 0)

	css .search__inner
		position: relative
		@lt-xl
			max-width: 600px
			margin: 0 auto
			width: 100%

	css .search--toggled
		background-color: rgba(0, 0, 0, .96)
