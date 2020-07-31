import Dexie from 'dexie'

export global class DB
	static prop database
	static prop schema

	static def init
		database = Dexie.new('my-db')
		schema = {}
		for own name, model of Record.models
			schema[model.table_name] = Object.keys(model.fields).join(',')

		database.version(1).stores(schema)