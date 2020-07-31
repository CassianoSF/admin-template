export tag Aside
	def changeTheme n
		$context.state.theme = n
		imba.commit!

	def close
		state.toggled = false

	<self>
		<div .sa-backdrop @pointerup.close> if state.toggled
		<div .themes .toggled=(state.toggled)>
			<a .themes__item .active=($context.state.theme == 1) @pointerup.changeTheme(1)>
				<img src="/img/bg/1.jpg">
			<a .themes__item .active=($context.state.theme == 2) @pointerup.changeTheme(2)>
				<img src="/img/bg/2.jpg">
			<a .themes__item .active=($context.state.theme == 3) @pointerup.changeTheme(3)>
				<img src="/img/bg/3.jpg">
			<a .themes__item .active=($context.state.theme == 4) @pointerup.changeTheme(4)>
				<img src="/img/bg/4.jpg">
			<a .themes__item .active=($context.state.theme == 5) @pointerup.changeTheme(5)>
				<img src="/img/bg/5.jpg">
			<a .themes__item .active=($context.state.theme == 6) @pointerup.changeTheme(6)>
				<img src="/img/bg/6.jpg">
			<a .themes__item .active=($context.state.theme == 7) @pointerup.changeTheme(7)>
				<img src="/img/bg/7.jpg">
			<a .themes__item .active=($context.state.theme == 8) @pointerup.changeTheme(8)>
				<img src="/img/bg/8.jpg">
			<a .themes__item .active=($context.state.theme == 9) @pointerup.changeTheme(9)>
				<img src="/img/bg/9.jpg">
			<a .themes__item .active=($context.state.theme == 10) @pointerup.changeTheme(10)>
				<img src="/img/bg/10.jpg" alt="">