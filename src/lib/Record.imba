import {v4} from "uuid"

export global class Record

	static prop table_name
	static prop models
	static prop index = {}
	static prop fields = {}
	static prop belongs_to = {}
	static prop inputs = {}

	static def setup
		Record.models ||= {}
		Record.models[self.name] ||= {} 
		Record.models[self.name]['fields'] ||= fields
		Record.models[self.name]['belongs_to'] ||= belongs_to
		Record.models[self.name]['table_name'] ||= table_name

	static get table
		DB[table_name]

	static def all
		let includes = {}
		for own rel, meta of belongs_to
			includes[rel] = "{rel}_id"

		table.with(includes).then do |records|
			for rec in records
				for own rel, meta of belongs_to
					if rec[rel] == []
						rec[rel] = null
					else
						rec[rel] = new meta.type rec[rel]
				new self(rec)

	static def find id
		let includes = {}
		for own rel, meta of belongs_to
			includes[rel] = "{rel}_id"

		table.where(id: id).with(includes).then do |records|
			for rec in records
				for own rel, meta of belongs_to
					if rec[rel] == []
						rec[rel] = null
					else
						rec[rel] = new meta.type rec[rel]
				return new self(rec)

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
		if self.id
			update()
		else
			create()

	def validate
		errors = null
		for own input, meta of constructor.inputs
			if meta.type.prototype instanceof Record
				console.log self, input
				if(not meta.null and (not self[input] or not self["{input}_id"]))
					errors ||= {}
					errors[input] =("{I18n.t.models[meta.type.table_name].human_name} {I18n.t.validation_error.not_null}")
			else
				if(not meta.null and not self[input])
					errors ||= {}
					errors[input] =("{I18n.t.models[constructor.table_name].fields[input]} {I18n.t.validation_error.not_null}")

	def update
		validate()
		if errors
			return false
		else
			DB[constructor.table_name].update(self.id, fields)
			return true

	def create
		self.id = v4()
		validate()
		if errors
			return false
		else
			DB[constructor.table_name].add(fields)
			return true

	def delete
		DB[constructor.table_name].delete(self.id)

	def constructor args
		for own k, v of constructor.inputs
			self[k] = args and args[k]

		for own k, v of constructor.fields
			self[k] = args and args[k]

		for own rel, meta of constructor.belongs_to
			self["{rel}_id"] = args and args["{rel}_id"]
			self[rel] = new meta.type(args and args[rel])