export class Router
	def constructor app
		app_root = app
		current = window.location.pathname
		window.addEventListener('popstate', do go(window.location.pathname))

	def go url
		current = url
		let page = url.slice(1, url.length - 1)
		window.history.pushState(page, page, url)
		app_root.render()