import Axios from "axios"
import {Sync} from "./Sync"

export default global class Api
	static prop api

	static def init url
		api = Axios.create({baseURL: url})

		api.interceptors.response.use() do |res|
			return res

		api.interceptors.request.use() do |req| 
			req.headers = {}
			req.headers.token = window.sessionStorage.getItem("token")
			return req

	static def login email, password
		api({
			url: "/login"
			method: 'POST'
			data:
				email: email
				password: password  
		})

	static def logout
		window.sessionStorage.removeItem("user")
		window.sessionStorage.removeItem("token")
		window.sessionStorage.removeItem("last_sync")
		Sync.unschedule()
		DB.delete()

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

	static def put resource, id, params
		api({
			url: "/{resource}/{id}"
			method: 'PUT'
			data: params
		})

	static def delete resource, id
		api({
			url: "/{resource}/{id}"
			method: 'DELETE'
		})

	static def hostReachable
		api({
			url: '/'
			method: 'head'
		})
		.then(do |resp| 
			return resp.status >= 200 and (resp.status <= 300 || resp.status == 304))
		.catch(do return false)
