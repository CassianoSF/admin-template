export global class Group < Record
	static prop table_name = 'groups'
	static prop fields = {
		id:          {type: :String}
		created_at:  {type: :Date}
		updated_at:  {type: :Date}
		name:        {type: :String}
		permission:  {type: :Permissions}
	}

Group.setup()

console.log Group.new