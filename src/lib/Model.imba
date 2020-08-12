import {v4} from "uuid"

export default global class Model
	static def setup(configs = {})
		throw 'setup must have plural_name' unless configs.plural_name
		throw 'setup must have singular_name' unless configs.singular_name
		Model.models ||= {}
		Model.models[configs.singular_name] ||= {}
		Model.models[configs.singular_name].class         = self
		Model.models[configs.singular_name].fields        = configs.fields or {}
		Model.models[configs.singular_name].belongs_to    = configs.belongs_to or {}
		Model.models[configs.singular_name].has_many      = configs.has_many or {}
		Model.models[configs.singular_name].index         = configs.index or {}
		Model.models[configs.singular_name].form          = configs.form or {}
		Model.models[configs.singular_name].show          = configs.show or {}
		Model.models[configs.singular_name].plural_name   = configs.plural_name
		Model.models[configs.singular_name].singular_name = configs.singular_name
		Model.models[configs.singular_name].sync          = configs.sync
		self.fields        = configs.fields or {}
		self.belongs_to    = configs.belongs_to or {}
		self.has_many      = configs.has_many or {}
		self.index         = configs.index or {}
		self.form          = configs.form or {}
		self.show          = configs.show or {}
		self.plural_name   = configs.plural_name
		self.singular_name = configs.singular_name
		self.sync          = configs.sync

	static get table
		DB[plural_name]

	static def all
		let includes = {}
		for own rel, meta of belongs_to
			includes[rel] = "{rel}_id"

		table.with(includes).then do |records|
			for rec in records
				for own rel, type of belongs_to
					if rec[rel] == []
						rec[rel] = null
					else
						let relation_model = Model.models[type].class
						rec[rel] = new relation_model rec[rel]
				new self(rec)

	static def find id
		let includes = {}
		for own rel, meta of belongs_to
			includes[rel] = "{rel}_id"

		table.where(id: id).with(includes).then do |records|
			for rec in records
				for own rel, type of belongs_to
					if rec[rel] == []
						rec[rel] = null
					else
						let relation_model = Model.models[type].class
						rec[rel] = new relation_model rec[rel]
				return new self(rec)

	static def hasRelation field
		belongs_to and !!belongs_to[field]

	prop errors

	get fields
		let own_fields = {}
		for own k, v of constructor.fields
			own_fields[k] = self[k]
		for own k, v of constructor.belongs_to
			if self[k]
				own_fields["{k}_id"] = self[k].id
		own_fields

	get main_field
		id

	def save
		self.id ? update() : create()

	def validate
		return true
		errors = null
		console.log I18n.t
		for own input, meta of constructor.form
			if meta.type.prototype instanceof Model
				if(not meta.null and (not self[input] or not self["{input}_id"]))
					errors ||= {}
					errors[input] =("{I18n.t.models[meta.type.plural_name].human_name} {I18n.t.validation_error.not_null}")
			else
				if(not meta.null and not self[input])
					errors ||= {}
					errors[input] =("{I18n.t.models[constructor.plural_name].fields[input]} {I18n.t.validation_error.not_null}")

	def update
		validate()
		return false if errors
		self.constructor.sync ? updateOffline() : updateOnline()

	def updateOffline
		self.updated_at = new Date()
		DB[constructor.plural_name].update(self.id, fields)
		return true

	def updateOnline
		let response = await Api.put(self.constructor.plural_name, {[self.constructor.singular_name]: self})
		console.log response

	def create
		self.id = v4()
		validate()
		return false if errors
		self.constructor.sync ? createOffline() : createOnline()

	def createOffline
		self.created_at = new Date()
		DB[constructor.plural_name].add(fields)
		return true

	def createOnline
		let response = await Api.post(self.constructor.plural_name, {[self.constructor.singular_name]: self})
		console.log response

	def delete
		self.constructor.sync ? deleteOffline() : deleteOnline()

	def deleteOnline
		let response = await Api.delete(self.constructor.plural_name, self.id)
		console.log response

	def deleteOffline
		DB[constructor.plural_name].delete(self.id)

	def constructor args
		for own k, v of constructor.form
			self[k] = args and args[k]

		for own k, v of constructor.fields
			self[k] = args and args[k]

		for own rel, type of constructor.belongs_to
			self["{rel}_id"] = args and args["{rel}_id"]
			self[rel] = new Model.models[type].class(args and args[rel])

