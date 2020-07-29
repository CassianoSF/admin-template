export tag Login
	def mount
		loading = false

	def login
		$context.session.login(email, password)
		$context.router.go('/')

	<self .login>
		<div .login__block>
			<div .login__block__header>
				<a .nav-link target="_blank" href='/'>
					<img src="/img/logo.svg" height=50>

			<div .login__block__body>
				<form>
					<div .form-group>
						<input bind=email @keypress.enter.login type="email" .form-control .text-center placeholder="User">

					<div .form-group>
						<input bind=password @keypress.enter.login type="password" .form-control .text-center placeholder="Password">

				<a @click.login .btn .btn--icon .login__block__btn>
					if loading
						<i .zmdi .zmdi-spinner .zmdi-hc-spin>
					else
						<i .zmdi .zmdi-long-arrow-right>

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