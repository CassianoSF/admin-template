export global class Record
	static prop table_name
	static prop models
	static prop fields

	static def setup
		Record.models ||= {}
		Record.models[self.name] ||= {} 
		Record.models[self.name]['fields'] ||= fields
		Record.models[self.name]['table_name'] ||= table_name
