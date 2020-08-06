export tag Login
	def mount
		loading = false
		show_intall_btn = true
		window.addEventListener('beforeinstallprompt') do |e|
			e.preventDefault()
			deferred_prompt = e

		window.addEventListener('DOMContentLoaded') do
			if window.navigator.standalone or window.matchMedia('(display-mode: standalone)').matches
				show_intall_btn = false
				render()
		render()

	def install
		deferred_prompt.prompt()
		choiceResult = await deferred_prompt.userChoice
		if (choiceResult.outcome === 'accepted')
			show_intall_btn = false
			render()

	def login
		invalid = false
		loading = true
		error = null
		let res = await Api.login(email, password).catch do |err|
			console.error err
			if err.response
				STATE.alerts.push(type: 'error', msg: 'Ocorreu um erro!')
			else
				STATE.alerts.push(type: 'error', msg: 'Não foi possível conectar com o servidor!')
		if res.data
			if res.data.error
				error = res.data.error
				STATE.alerts.push(type: 'error', msg: res.data.error)
				invalid = true
			else
				window.sessionStorage.setItem('user', JSON.stringify(res.data.user))
				STATE.user = res.data.user
				Router.go('/')

		loading = false

	<self .login>
		<div .login__block>
			<div .login__block__header>
				<a .nav-link target="_blank" href='http://v2.imba.io'>
					<img src="/img/logo.svg" height=50>

			<div .login__block__body>
				<form>
					<div .form-group>
						<input bind=email @keypress.enter.login .is-invalid=(invalid) .form-control .text-center type="email" placeholder="User" >

					<div .form-group>
						<input bind=password @keypress.enter.login .is-invalid=(invalid) .form-control .text-center type="password" placeholder="Password" >

					if invalid
						<p[color: #dc3545]> error
				if show_intall_btn
					<button @click.install [mr: 20px] .btn .btn-light>
							<i .zmdi .zmdi-google-play>
							" Instalar"
				<button @click.login .btn .btn-light>
					if loading
						<i .zmdi .zmdi-spinner .zmdi-hc-spin>
						" Entrar"
					else
						<i .zmdi .zmdi-long-arrow-right>
						" Entrar"


			<ul .nav .footer__nav>


	css .login
		min-height: 100vh
		display: -ms-flexbox
		display: flex
		-webkit-box-align: center
		-ms-flex-align: center
		align-items: center
		-webkit-box-pack: center
		-ms-flex-pack: center
		justify-content: center
		padding-top: 1.2rem

	css .login__block
		text-align: center
		max-width: 330px
		width: 100%
		padding: 1rem
		-webkit-animation-name: fadeInUp
		animation-name: fadeInUp
		animation-duration: .3s
		animation-fill-mode: both
		background-color: rgba(0, 0, 0, .2)
		border-radius: 2px
		z-index: 10

	css .login__block__header
		padding: 0.3rem
		position: relative
		border-radius: 2px
		background-color: rgba(0, 0, 0, .15) @hover:rgba(0, 0, 0, .25)
		margin-bottom: 2rem

	css .login__block__body
		padding: 1rem

	css .login__block__btn
		margin-top: .5rem;
		background-color: rgba(0, 0, 0, .15) @hover:rgba(0, 0, 0, .25)