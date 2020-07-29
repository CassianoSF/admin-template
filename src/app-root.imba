import {Router} from './lib/Router'
import {Session} from './lib/Session'

import {Login} from './pages/Login'
import {Home} from './pages/Home'

import {Sidebar} from './components/layout/Sidebar'
import {Header} from './components/layout/Header'


tag app-root
	def build
		state =
			sidebar:
				toggled: false
			background: "url('/img/bg/1.jpg')"


		router = Router.new(self)
		session = Session.new()

	def mount
		await router.go('/login') unless session.isLoggedIn()

	<self .app [background-image: {state.background}]>
		<.main>
			if router.current == '/login'
				<Login> 
			else
				<Header>
				<Sidebar state=state.sidebar>

				<section .content>
					<Home> if router.current == '/'

	css .app
		position: absolute
		t: 0 r: 0 l: 0
		font-family: Nunito, sans-serif
		font-size: 1rem
		font-weight: 400
		line-height: 1.5
		color: rgba(255, 255, 255, 1)
		background-repeat: no-repeat
		background-attachment: fixed
		background-size: 100% 100%

	css .main
		position: relative
		overflow-x: hidden

	css .content
		min-height: 100vh
		overflow-y: hidden

imba.mount <app-root>