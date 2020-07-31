export class Session
	def isLoggedIn
		JSON.parse(window.sessionStorage.getItem('logged_in'))

	def login email, password
		await Promise.new(do |resolve| setTimeout(resolve, 1000))
		window.sessionStorage.setItem('logged_in', true)

	def logout
		window.sessionStorage.setItem('logged_in', false)



