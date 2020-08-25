export default tag Aside
	def changeTheme n
		STATE.theme = n
		imba.commit!

	def close
		STATE.aside.toggled = false

	<self>
		<div .sa-backdrop @click.close> if STATE.aside.toggled
		<div .themes .toggled=(STATE.aside.toggled)>
			<a .themes__item .active=(STATE.theme == 1) @click.changeTheme(1)>
				<img src="/img/bg/1.jpg">
			<a .themes__item .active=(STATE.theme == 2) @click.changeTheme(2)>
				<img src="/img/bg/2.jpg">
			<a .themes__item .active=(STATE.theme == 3) @click.changeTheme(3)>
				<img src="/img/bg/3.jpg">
			<a .themes__item .active=(STATE.theme == 4) @click.changeTheme(4)>
				<img src="/img/bg/4.jpg">
			<a .themes__item .active=(STATE.theme == 5) @click.changeTheme(5)>
				<img src="/img/bg/5.jpg">
			<a .themes__item .active=(STATE.theme == 6) @click.changeTheme(6)>
				<img src="/img/bg/6.jpg">
			<a .themes__item .active=(STATE.theme == 7) @click.changeTheme(7)>
				<img src="/img/bg/7.jpg">
			<a .themes__item .active=(STATE.theme == 8) @click.changeTheme(8)>
				<img src="/img/bg/8.jpg">
			<a .themes__item .active=(STATE.theme == 9) @click.changeTheme(9)>
				<img src="/img/bg/9.jpg">
			<a .themes__item .active=(STATE.theme == 10) @click.changeTheme(10)>
				<img src="/img/bg/10.jpg" alt="">

	css.sa-backdrop
		position: fixed
		width: 100vw
		height: 100vh
		top: 0
		left: 0
		z-index: 102


	css .themes
		position: fixed
		overflow-y: scroll
		top: 0
		right: 0
		height: 100%
		width: 250px
		background-color: rgba(0, 0, 0, .96)
		z-index: 103
		-webkit-transform: translate3d(260px, 0, 0)
		transform: translate3d(260px, 0, 0)
		transition: box-shadow .3s, opacity .3s, -webkit-transform .3s
		transition: box-shadow .3s, transform .3s, opacity .3s
		transition: box-shadow .3s, transform .3s, opacity .3s, -webkit-transform .3s

	css .themes.toggled
		box-shadow: -5px 0 10px rgba(0, 0, 0, .25)
		opacity: 1
		-webkit-transform: translate3d(0, 0, 0)
		transform: translate3d(0, 0, 0)

	css .themes__item
		display: block
		padding: 1.5rem
		position: relative
		transition: background-color .3s, border-color .3s

	css .themes__item 
		img
			width: 100%
			height: 100px

	css .themes__item .active, .themes__item@hover
		background-color: rgba(255, 255, 255, .02)
		border-bottom-color: transparent
