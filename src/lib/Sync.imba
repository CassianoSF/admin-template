class Synchronizer
	prop models = {}

	def init
		for own model, vals of Model.models
			models[model] = vals.class

		window.addEventListener('online') do
			STATE.alerts.push(type: 'info', msg: I18n.t.online)
			run()
			imba.commit!

		window.addEventListener('offline') do 
			STATE.alerts.push(type: 'warning', msg: I18n.t.offline)
			imba.commit!

		interal = setInterval(run.bind(this), 10 * 1000)
		run()

	def unschedule
		clearInterval(interal)

	def run

		let online = await Api.hostReachable()
		return if not online

		let last_update = await Api.get('last-update')
		last_update = Date.new(last_update.data).toJSON()
		let last_sync = window.sessionStorage.getItem('last_sync')
		return if last_sync and last_update <= last_sync


		for own name, model of models
			let records = []
			if model.sync
				if last_sync
					records = await model.table.where('updated_at').above(last_sync).toArray()
				else
					records = await model.table.toArray()

			let res = await Api.post("sync-{model.plural_name}", {
				last_sync: last_sync
				to_sync: records
				limit: 100
				offset: 0
			})

			model.table.bulkPut(res.data.records)
			syncTable(model, 1)
		window.sessionStorage.setItem('last_sync', Date.new.toJSON())

	def syncTable model, current_page
		let res = await Api.post("sync-{model.plural_name}", {
			last_sync: last_sync
			limit: 100
			offset: 100 * current_page
		})
		model.table.bulkPut(res.data.records)
		return if current_page * 100 > res.data.total
		syncTable(model, current_page + 1)

export const Sync = Synchronizer.new