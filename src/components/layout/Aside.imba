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