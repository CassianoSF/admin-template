# ==== Fade In

# bounceIn
# bounceInDown
# bounceInLeft
# bounceInRight
# bounceInUp
# fadeIn
# fadeInDown
# fadeInDownBig
# fadeInLeft
# fadeInLeftBig
# fadeInRight
# fadeInRightBig
# fadeInUp
# fadeInUpBig
# flipInX
# flipInY
# lightSpeedIn
# rotateIn
# rotateInDownLeft
# rotateInDownRight
# rotateInUpLeft
# rotateInUpRight
# rollIn
# zoomIn
# zoomInDown
# zoomInLeft
# zoomInRight
# zoomInUp
# slideInDown
# slideInLeft
# slideInRight
# slideInUp

# ==== Fade Out

# bounceOut
# bounceOutDown
# bounceOutLeft
# bounceOutRight
# bounceOutUp
# fadeOut
# fadeOutDown
# fadeOutDownBig
# fadeOutLeft
# fadeOutLeftBig
# fadeOutRight
# fadeOutRightBig
# fadeOutUp
# fadeOutUpBig
# flipOutX
# flipOutY
# lightSpeedOut
# rotateOut
# rotateOutDownLeft
# rotateOutDownRight
# rotateOutUpLeft
# rotateOutUpRight
# rollOut
# zoomOut
# zoomOutDown
# zoomOutLeft
# zoomOutRight
# zoomOutUp
# slideOutDown
# slideOutLeft
# slideOutRight
# slideOutUp

# === Positions

# top
# top-left
# top-right
# bottom
# bottom-left
# bottom-right


export tag Alerts
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
			setTimeout(&, 500) do STATE.alerts.shift()

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

		>
			<span>
				data.msg
			<a>
				<button .close .btn .btn-sm .btn-light type="button" >
					<span :click.close>
						"×"