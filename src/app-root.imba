# LIBS
import {Router}  from './lib/Router'
import {Api}     from './lib/Api'
import {Record}  from './lib/Record'
import {DB}      from './lib/DB'
import {I18n}    from './lib/I18n'

# MODELS
import {User}          from './models/admin/User'
import {Group}         from './models/admin/Group'

import {CarroNasc}     from './models/cadastros/CarroNasc'
import {CarroInc}      from './models/cadastros/CarroInc'
import {Incubadora}    from './models/cadastros/Incubadora'
import {Nascedouro}    from './models/cadastros/Nascedouro'
import {Vacina}        from './models/cadastros/Vacina'
import {Lote}          from './models/cadastros/Lote'

import {Armazenamento} from './models/processos/Armazenamento'
import {Incubacao}     from './models/processos/Incubacao'
import {Integracao}    from './models/processos/Integracao'
import {Nascimento}    from './models/processos/Nascimento'
import {Processamento} from './models/processos/Processamento'
import {Recebimento}   from './models/processos/Recebimento'
import {Transferencia} from './models/processos/Transferencia'

import {Pacote}        from './models/Pacote'

# PAGES
import {Login}           from './pages/Login'
import {Home}            from './pages/Home'
import Crud            from './pages/Crud'

# COMPONENTS
import {Sidebar} from './components/layout/Sidebar'
import {Header}  from './components/layout/Header'
import {Aside}   from './components/layout/Aside'
import {Alerts}   from './components/ui/Alerts'


global.STATE = {
	alerts: []
	aside: {}
	sidebar: {}
	theme: 1
	user: JSON.parse(window.sessionStorage.getItem('user'))
}

tag App
	def build
		Router.init()
		Router.go('/login') unless STATE.user
		DB.init()
		I18n.init('pt_br')
		Api.init('http://localhost:3000')
		# Api.init('https://arcane-scrubland-94321.herokuapp.com')

	def themeBg
		"url('/img/bg/{STATE.theme}.jpg')"

	<self .app [background-image@md: {themeBg()} background-color: gray]>
		<.main>
			<Alerts>
			if Router.current == '/login'
				<Login>
			else
				<Header>
				<Sidebar>
				<Aside>
				<section .content>
					<Home>                     if Router.current == '/'
					<Crud model=User>          if Router.to('/users')
					<Crud model=Armazenamento> if Router.to('/armazenamento')
					<Crud model=Incubacao>     if Router.to('/incubacao')
					<Crud model=Integracao>    if Router.to('/integracao')
					<Crud model=Nascimento>    if Router.to('/nascimento')
					<Crud model=Processamento> if Router.to('/processamento')
					<Crud model=Recebimento>   if Router.to('/recebimento')
					<Crud model=Transferencia> if Router.to('/transferencia')


					<Crud model=Lote>        if Router.to('/lote')
					<Crud model=Incubadora>  if Router.to('/incubadora')
					<Crud model=Nascedouro>  if Router.to('/nascedouro')
					<Crud model=CarroInc>    if Router.to('/carro_inc')
					<Crud model=CarroNasc>   if Router.to('/carro_nasc')


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

imba.mount <App>