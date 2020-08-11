export global class Router
	static prop current = window.location.pathname
	static prop path

	static def init
		window.addEventListener('popstate') do |e|
			current = e.state.slice(2)
			path = current.split('/')
			imba.commit!

	static def go url
		current = url
		path = current.split('/')
		window.history.pushState("/#{url}", "/#{url}", "/#{url}")

	static def to url
		RegExp(url).exec(current)