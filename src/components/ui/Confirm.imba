export tag Confirm
	prop message
	prop closing

	def close
		closing = yes
		setTimeout(&, 500) do
			closing = no
			emit('close')		

	def submit
		closing = yes
		setTimeout(&, 500) do
			closing = no
			emit('submit')	

	<self>
		<div :click.close .swal2-container .animated .bounceIn .bounceOut=(closing)>
			<div .swal2-modal>
				<div .swal2-icon .swal2-warning>
					"!"
				<h2 .swal2-title>
					message
				<div .swal2-buttonswrapper>
					<button :click.submit .swal2-confirm .btn .btn-danger>
						"Confirmar"
					<button :click.close .swal2-cancel .btn .btn-light>
						"Cancel"


