export global class Router
	static prop current = window.location.pathname

	static def init
		window.addEventListener('popstate') do |e|
			current = e.state
			imba.commit()

	static def go url
		current = url
		window.history.pushState("/#{url}", "/#{url}", "/#{url}")
