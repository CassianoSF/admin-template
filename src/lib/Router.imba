export class Router
	prop current = window.location.pathname

	def constructor
		window.addEventListener('popstate') do |e|
			current = e.state
			imba.commit()

	def go url
		current = url
		window.history.pushState(url, url, url)
