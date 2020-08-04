import {v4} from 'uuid'

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

	def update
		DB[constructor.table_name].update(self.id, fields)

	def create
		self.id = v4()
		DB[constructor.table_name].add(fields)

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