import Dexie from "dexie"
import relationships from 'dexie-relationships'

export global class DB
	static prop database
	static prop schema

	static def init
		database = new Dexie('my-db', {addons: [relationships]})
		schema = {}
		for own name, model of Record.models
			let columns = Object.keys(model.fields).join(',')
			if Object.keys(model.belongs_to).length
				for own relation, meta of model.belongs_to
					columns += ", {relation}_id -> {meta.type.table_name}.id"

			schema[model.table_name] = columns
		
		database.version(6).stores(schema)


		for own name, model of Record.models
			self[model.table_name] = database[model.table_name]

