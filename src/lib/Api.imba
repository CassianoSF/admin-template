import Axios from "axios"

export default global class Api
	static prop headers
	static prop api

	static def init url
		api = Axios.create({baseURL: url})

		api.interceptors.response.use() do |res|
			window.sessionStorage.setItem("headers", JSON.stringify(res.headers))
			return res

		api.interceptors.request.use() do |req| 
			req.headers = JSON.parse(window.sessionStorage.getItem("headers"))
			return req

		initSyncHandler()

	static def initSyncHandler
		Model.models

	static def login email, password
		api({
			url: "/login"
			method: 'POST'
			data:
				email: email
				password: password  
		})

	static def logout
		window.sessionStorage.removeItem("headers")
		window.sessionStorage.removeItem("user")
		STATE.user = null

	static def get resource, params
		api({
			url: "/{resource}"
			method: 'GET'
			params: params
		})

	static def post resource, params
		api({
			url: "/{resource}"
			method: 'POST'
			data: params
		})

	static def put resource, params
		api({
			url: "/{resource}"
			method: 'PUT'
			data: params
		})

	static def delete resource, id
		api({
			url: "/{resource}/{id}"
			method: 'DELETE'
		})

