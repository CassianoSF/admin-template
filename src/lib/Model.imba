import {v4} from "uuid"
import {Sync} from './Sync'

export default global class Model
	static def setup configs = {}
		throw 'setup must have plural_name' unless configs.plural_name
		throw 'setup must have singular_name' unless configs.singular_name
		Model.models ||= {}
		Model.models[configs.singular_name] ||= {}
		Model.models[configs.singular_name].class = self

		for config in ['fields', 'belongs_to', 'has_many', 'index', 'form', 'show', 'validates']
			Model.models[configs.singular_name][config] = configs[config] or {}
			self[config] = configs[config] or {}

		for config in ['plural_name', 'singular_name', 'sync']
			Model.models[configs.singular_name][config] = configs[config]
			self[config] = configs[config]

	static get table
		DB[plural_name]

	static get includes
		let includs = {}
		for own rel, meta of belongs_to
			includs[rel] = "{rel}_id"

		for own rel, meta of has_many
			includs[rel] = rel
		includs

	static def ormRecord(rec)
		for own rel, type of has_many
			if rec[rel]
				rec[rel] = for r in rec[rel]
					let relation_model = Model.models[type].class
					relation_model.new(r)

		for own rel, type of belongs_to
			if rec[rel] == []
				rec[rel] = null
			else
				let relation_model = Model.models[type].class
				rec[rel] = relation_model.new(rec[rel])
		return self.new(rec)

	static def all
		table.orderBy('updated_at').reverse().with(includes).then do |records|
			for rec in records
				ormRecord(rec)

	static def find id
		table.where(id: id).with(includes).then do |records|
			for rec in records
				return ormRecord(rec)
			return null

	static def hasRelation field
		belongs_to and !!belongs_to[field]

	prop errors

	get fields
		let own_fields = {}
		for own k, v of constructor.fields
			own_fields[k] = self[k]
		for own k, v of constructor.belongs_to
			if self[k]
				own_fields["{k}_id"] = self["{k}_id"] or self[k].id
		own_fields

	get plural_name
		constructor.plural_name

	get singular_name
		constructor.singular_name

	get main_field
		id

	def save
		self.id ? update() : create()

	def validate
		errors = null
		if constructor.validates.presence
			for field in constructor.validates.presence
				if constructor.belongs_to[field]
					if not self[field] or not self["{field}_id"]
						errors ||= {}
						errors[field] ||= []
						errors[field].push("{I18n.t.models[Model.models[constructor.belongs_to[field]].plural_name].plural_name} {I18n.t.validation_error.not_null}")
				else
					if not self[field]
						errors ||= {}
						errors[field] ||= []
						errors[field].push("{I18n.t.models[constructor.plural_name].fields[field]} {I18n.t.validation_error.not_null}")

	def create
		validate()
		return false if errors
		self.constructor.sync ? createLocal() : createRemote()

	def update
		self.updated_at = null
		validate()
		return false if errors
		self.constructor.sync ? updateLocal() : updateRemote()

	def createLocal
		self.id ||= v4()
		self.created_at ||= Date.new().toJSON()
		DB[constructor.plural_name].put(fields)
		return true

	def updateLocal
		self.updated_at ||= Date.new().toJSON()
		DB[constructor.plural_name].put(fields)
		return true

	def createRemote
		errors = null
		let response = await Api.post(plural_name, {[singular_name]: self})
			.catch(handleResponseErrors.bind(this))
		console.log response
		return false if errors
		saveResponse(response.data)

	def updateRemote
		errors = null
		let response = await Api.put(plural_name, self.id, {[singular_name]: self})
			.catch(handleResponseErrors.bind(this))
		return false if errors
		saveResponse(response.data)

	def handleResponseErrors err
		if err.response and err.response.statusText is "Unprocessable Entity"
			errors = err.response.data
		else
			throw err

	def saveResponse data
		for own field, val of data
			self[field] = val
			if constructor.has_many[field]
				for rec in val
					let model = Model.models[constructor.has_many[field]].class
					model.new(rec).updateLocal()
		updateLocal()

	def delete
		self.constructor.sync ? deleteLocal() : deleteRemote()

	def deleteRemote
		let response = await Api.delete(plural_name, self.id)
			.catch(handleResponseErrors.bind(this))
		deleteLocal()

	def deleteLocal
		DB[constructor.plural_name].delete(self.id)

	def constructor args
		for own k, v of constructor.form
			self[k] = args and args[k]

		for own k, v of constructor.fields
			self[k] = args and args[k]

		for own rel, type of constructor.belongs_to
			self["{rel}_id"] = args and args["{rel}_id"]
			self[rel] = Model.models[type].class.new(args and args[rel])

		for own rel, type of constructor.has_many
			self[rel] ||= []
			self[rel] = args[rel] if args

