export class Audit < Model

Audit.setup({
	plural_name: 'audits'
	singular_name: 'audit'
	sync: true
	fields:
		id:                :integer,
		auditable_id:      :integer,
		auditable_type:    :string,
		associated_id:     :string,
		associated_type:   :string,
		user_id:           :string,
		user_type:         :string,
		username:          :string,
		action:            :string,
		audited_changes:   :string,
		version:           :integer,
		comment:           :string,
		remote_address:    :string,
		request_uuid:      :string,
		created_at:        :date,
		updated_at:        :date

})