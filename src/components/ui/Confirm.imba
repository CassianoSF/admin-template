export default tag Confirm
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

	<self :click.close .confirm-container>
		<div .confirm-modal .animated .bounceIn .bounceOut=(closing)>
			<div .confirm-icon .confirm-warning>
				"!"
			<h2 .confirm-title>
				message
			<div .confirm-buttonswrapper>
				<button :click.submit .confirm-confirm .btn .confirm-btn .btn-danger>
					"Confirmar"
				<button :click.close .confirm-cancel .btn .confirm-btn .btn-light>
					"Cancel"


	css .confirm-icon, .confirm-image
		margin-top: 0
		margin-bottom: 1.5rem

	css .confirm-warning
		font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif
		color: #f8bb86
		border: 4px solid transparent
		border-color: #facea8
		font-size: 60px
		line-height: 80px
		text-align: center

	css .confirm-icon
		width: 80px
		height: 80px
		border-radius: 50%
		margin: 20px auto 30px
		padding: 0
		position: relative
		-webkit-box-sizing: content-box
		box-sizing: content-box
		cursor: default
		-webkit-user-select: none
		-moz-user-select: none
		-ms-user-select: none
		user-select: none

	css .confirm-modal
		background-color: #fff
		font-family: Nunito,sans-serif
		border-radius: 5px
		-webkit-box-sizing: border-box
		box-sizing: border-box
		text-align: center
		margin: auto
		overflow-x: hidden
		overflow-y: auto
		display: none
		position: relative
		max-width: 100%
		padding: 20px 
		background: rgba(0, 0, 0, 0.96) 
		display: block 

	css .confirm-container
		display: -webkit-box
		display: -ms-flexbox
		display: flex
		-webkit-box-align: center
		-ms-flex-align: center
		align-items: center
		position: fixed
		top: 0
		left: 0
		bottom: 0
		right: 0
		padding: 10px
		z-index: 2060
		overflow-y: hidden
		background-color: rgba(0, 0, 0, .2)

	css .confirm-success
		border-color: #a5dc86

	css .confirm-container.confirm-fade
		-webkit-transition: background-color .1s
		transition: background-color .1s

	css .confirm-modal
		border-radius: 2px
		padding: 2.5rem
		font-family: Nunito, sans-serif
		box-shadow: 0 4px 18px rgba(0, 0, 0, .5)

	css .confirm-title
		font-size: 1.1rem
		position: relative
		color: #fff
		line-height: inherit
		margin: 0 0 5px
		font-weight: 400

	css .confirm-icon, .confirm-image
		margin-top: 0
		margin-bottom: 1.5rem

	css .confirm-content
		color: rgba(255, 255, 255, .7)
		font-size: 1rem
		font-weight: 400

	css .confirm-buttonswrapper
		margin-top: 30px

	css .confirm-btn
		margin: 0 3px
		box-shadow: none
