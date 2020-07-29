export class Session
	def isLoggedIn
		JSON.parse(window.sessionStorage.getItem('logged_in'))

	def login email, password
		window.sessionStorage.setItem('logged_in', true)

	def logout
		window.sessionStorage.setItem('logged_in', false)



