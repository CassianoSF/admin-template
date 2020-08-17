export default tag Alert
	prop life

	def mount
		data.bounce_in = true
		life = 0
		top = 70 * index + 20
		$interval = setInterval(tick.bind(self), 375)
		render()
		
	def tick
		life += 375
		top = 70 * index  + 20
		let first = alerts.filter(do(d) !d.dead)[0]
		if first != data and first.fade_out
			data.move_up = true
		else
			data.move_up = false
		
		if life >= 750
			data.bounce_in = false
		if top == 20
			data.start ||= life
		if life > data.start + 2000
			data.fade_out ||= life
		if life > data.fade_out + 750
			data.dead = true
			clearInterval($interval)
			self.remove()

		render()
			
	get index
		alerts.filter(do(d) !d.dead).indexOf(data)
				
	def render
		return unless top
		<self [top: {top}px]
			.alert 
			.alert--notify 
			.animated
			.alert-top-right
			.fadeOutRight=(data.fade_out)
			.moveUp=(data.move_up)
			.bounceIn=(data.bounce_in)
			.{"alert-{data.type}"}

		>
			<span>
				data.msg

	css .alert 
		color: #fff
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

	css .alert--notify
		box-shadow: 0 3px 10px rgba(0, 0, 0, .3)

	css .alert--notify@not(.alert-info)@not(.alert-success)@not(.alert-warning)@not(.alert-danger)
		background-color: rgba(0, 0, 0, .96)

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
