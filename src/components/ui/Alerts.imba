export default tag Alerts

	def render
		<self>
			for data, i in STATE.alerts
				<Alert[top: {20 + i*70}px] data=data>

tag Alert
	def mount
		fade_out = false
		render()
		setTimeout(&, 3000) do
			fade_out = true
			render()
			setTimeout(&, 500) do 
				STATE.alerts.shift()

	def close
		fade_out = true
		render()

	def render
		<self 
			.alert 
			.alert--notify 
			.animated
			.alert-dismissible 
			.alert-top-right
			.fadeOutRight=(fade_out)
			.bounceIn
			.alert-danger=(data.type == 'error')
			.alert-success=(data.type == 'success')
			.alert-info=(data.type == 'info')
			.alert-warning=(data.type == 'warning')

		>
			<span>
				data.msg
			<a>
				<button .close .btn .btn-sm .btn-light type="button" >
					<span :click.close>
						"×"

	css .alert 
		padding: 18px 24px
		margin-bottom: 1rem
		border: 0 solid transparent
		border-radius: 2px


	css .alert-link 
		font-weight: 400
		color: #fff
		border-bottom: 1px dotted rgba(255, 255, 255, .4)
	
	css .alert-link@focus, .alert-link@hover 
		opacity: .9
		color: #fff

	css .alert-primary 
		background-color: rgba(0, 123, 255, .95)
		border-color: #007bff

	css .alert-secondary 
		background-color: rgba(255, 255, 255, .95)
		border-color: #fff

	css .alert-success 
		background-color: rgba(40, 167, 69, .95)
		border-color: #28a745

	css .alert-info 
		background-color: rgba(23, 162, 184, .95)
		border-color: #17a2b8

	css .alert-warning 
		background-color: rgba(255, 193, 7, .95)
		border-color: #ffc107

	css .alert-danger 
		background-color: rgba(220, 53, 69, .95)
		border-color: #dc3545

	css .alert-heading 
		font-weight: 600
		font-size: 1.1rem
		margin: .15rem 0 1rem
		color: inherit

	css .alert-dismissible 
		.close 
			margin-left: 2rem

	css .close
		span@not(.sr-only)
			transition: opacity .3s
			background-color: rgba(255, 255, 255, .2)
			opacity: .8
			line-height: 17px
			height: 19px
			width: 19px
			border-radius: 50%
			font-size: 1rem
			display: block
			font-weight: 600
			color: #fff
	
	css.close@hover
		opacity: 1

	css .alert--notify
		box-shadow: 0 3px 10px rgba(0, 0, 0, .3)

	css .alert--notify@not(.alert-info)@not(.alert-success)@not(.alert-warning)@not(.alert-danger)
		background-color: rgba(0, 0, 0, .96)

	css .close
		transition: opacity .3s
		cursor: pointer

	css .alert-top, .alert-top-left, .alert-top-right, .alert-bottom, .alert-bottom-left, .alert-bottom-right
		display: inline-block
		margin: 0px auto
		position: fixed
		transition: all 0.5s ease-in-fade_out
		z-index: 1031
		animation-iteration-count: 1

	css .alert-top-left, .alert-top
		left: 20px

	css .alert-top-right, .alert-top
		right: 20px

	css .alert-bottom, .alert-bottom-left 
		left: 20px

	css .alert-bottom, .alert-bottom-right
		right: 20px
