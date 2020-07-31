import {Router} from './lib/Router'
import {Session} from './lib/Session'
import {Record} from './lib/Record'
import {DB} from './lib/DB'
import {I18n} from './lib/I18n'

import {User} from './models/User'
import {Group} from './models/Group'

import {Login} from './pages/Login'
import {Home} from './pages/Home'
import {Crud} from './pages/Crud'

import {Sidebar} from './components/layout/Sidebar'
import {Header} from './components/layout/Header'
import {Aside} from './components/layout/Aside'

DB.init()
I18n.init('pt_br')

tag app-root
	def build
		state =
			aside: {}
			sidebar: {}
			theme: 1

		router = Router.new()
		session = Session.new()

	def mount
		await router.go('/login') unless session.isLoggedIn()

	def themeBg
		"url('/img/bg/{state.theme}.jpg')"

	<self .app [background-image: {themeBg()}]>
		<.main>
			if router.current == '/login'
				<Login>
			else
				<Header>
				<Sidebar state=state.sidebar>
				<Aside state=state.aside>
				<section .content>
					<Home> if router.current == '/'
					<Crud model=User> if router.current == '/users'


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
		transition: background .3s;

	css .main
		position: relative
		overflow-x: hidden

	css .content
		min-height: 100vh
		overflow-y: hidden

imba.mount <app-root>