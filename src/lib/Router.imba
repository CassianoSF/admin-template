export default global class Router
	static def init app
		app = app 
		current = window.location.hash.slice(1)
		path = current.split('/')
		window.addEventListener('popstate') do |e|
			current = window.location.hash.slice(1)
			path = current.split('/')
			imba.commit!

	static def go url
		current = url
		path = current.split('/')
		window.history.pushState("/#{url}", "/#{url}", "/#{url}")

	static def goBack
		window.history.back()
		current = window.location.hash.slice(1)
		path = current.split('/')

	static def to url
		RegExp(url).exec(current)