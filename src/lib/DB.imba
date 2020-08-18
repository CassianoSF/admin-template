import Dexie from "dexie"
import relationships from 'dexie-relationships'

export default global class DB
	static prop database
	static prop schema

	static def init
		database = new Dexie('my-db', {addons: [relationships]})
		schema = {}
		for own name, model of Model.models
			let columns = Object.keys(model.fields).join(',')
			if model.belongs_to
				for own relation, type of model.belongs_to
					columns += ", {relation}_id -> {Model.models[type].plural_name}.id"

			schema[model.plural_name] = columns
		
		database.version(1).stores(schema)


		for own name, model of Model.models
			self[model.plural_name] = database[model.plural_name]

	static def delete
		database.delete()

