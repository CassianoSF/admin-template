global css 
	.animated
		animation-duration: 0.5s
		animation-fill-mode: both

	.animated.infinite 
		animation-iteration-count: infinite
	
	.animated.hinge 
		animation-duration: 2s
	
	.animated.bounceIn,.animated.bounceOut,.animated.flipOutX,.animated.flipOutY 
		animation-duration: .75s
	
	@keyframes bounce 
		to 
			animation-timing-function: cubic-bezier(.215, .61, .355, 1)
			transform: translateZ(0)
		43% 
			transform: translate3d(0, -30px, 0)
		70% 
			animation-timing-function: cubic-bezier(.755, .05, .855, .06)
			transform: translate3d(0, -15px, 0)
		90% 
			transform: translate3d(0, -4px, 0)

	.bounce 
		animation-name: bounce
		transform-origin: center bottom

	@keyframes flash 
		to 
			opacity: 1
		
		75% 
			opacity: 0

	.flash 
		animation-name: flash

	@keyframes pulse 
		0% 
			transform: scaleX(1)
		
		50% 
			transform: scale3d(1.05, 1.05, 1.05)		
		to 
			transform: scaleX(1)	

	.pulse 
		animation-name: pulse

	@keyframes rubberBand 
		0% 
			transform: scaleX(1)
		
		30% 
			transform: scale3d(1.25, .75, 1)
		
		40% 
			transform: scale3d(.75, 1.25, 1)
		
		50% 
			transform: scale3d(1.15, .85, 1)
		
		65% 
			transform: scale3d(.95, 1.05, 1)
		
		75% 
			transform: scale3d(1.05, .95, 1)		
		to 
			transform: scaleX(1)	

	.rubberBand 
		animation-name: rubberBand

	@keyframes shake 
		to 
			transform: translateZ(0)
		
		90% 
			transform: translate3d(-10px, 0, 0)
		
		80% 
			transform: translate3d(10px, 0, 0)	

	.shake 
		animation-name: shake

	@keyframes headShake 
		0% 
			transform: translateX(0)
		
		6.5% 
			transform: translateX(-6px) rotateY(-9deg)
		
		18.5% 
			transform: translateX(5px) rotateY(7deg)
		
		31.5% 
			transform: translateX(-3px) rotateY(-5deg)
		
		43.5% 
			transform: translateX(2px) rotateY(3deg)
		
		50% 
			transform: translateX(0)	

	.headShake 
		animation-timing-function: ease-in-out
		animation-name: headShake

	@keyframes swing 
		20% 
			transform: rotate(15deg)
		
		40% 
			transform: rotate(-10deg)
		
		60% 
			transform: rotate(5deg)
		
		80% 
			transform: rotate(-5deg)		
		to 
			transform: rotate(0deg)	

	.swing 
		transform-origin: top center
		animation-name: swing
	


	@keyframes tada 
		0% 
			transform: scaleX(1)
		
		20% 
			transform: scale3d(.9, .9, .9) rotate(-3deg)
		
		90% 
			transform: scale3d(1.1, 1.1, 1.1) rotate(3deg)
		
		80% 
			transform: scale3d(1.1, 1.1, 1.1) rotate(-3deg)		
		to 
			transform: scaleX(1)	

	.tada 
		animation-name: tada

	@keyframes wobble 
		0% 
			transform: none
		
		15% 
			transform: translate3d(-25%, 0, 0) rotate(-5deg)
		
		30% 
			transform: translate3d(20%, 0, 0) rotate(3deg)
		
		45% 
			transform: translate3d(-15%, 0, 0) rotate(-3deg)
		
		60% 
			transform: translate3d(10%, 0, 0) rotate(2deg)
		
		75% 
			transform: translate3d(-5%, 0, 0) rotate(-1deg)		
		to 
			transform: none	

	.wobble 
		animation-name: wobble
	


	@keyframes jello 
		to 
			transform: none
		
		22.2% 
			transform: skewX(-12.5deg) skewY(-12.5deg)
		
		33.3% 
			transform: skewX(6.25deg) skewY(6.25deg)
		
		44.4% 
			transform: skewX(-3.125deg) skewY(-3.125deg)
		
		55.5% 
			transform: skewX(1.5625deg) skewY(1.5625deg)
		
		66.6% 
			transform: skewX(-.78125deg) skewY(-.78125deg)
		
		77.7% 
			transform: skewX(.390625deg) skewY(.390625deg)
		
		88.8% 
			transform: skewX(-.1953125deg) skewY(-.1953125deg)	

	.jello 
		animation-name: jello
		transform-origin: center

	@keyframes bounceIn 
		to 
			animation-timing-function: cubic-bezier(.215, .61, .355, 1)
		
		0% 
			opacity: 0
			transform: scale3d(.3, .3, .3)
		
		20% 
			transform: scale3d(1.1, 1.1, 1.1)
		
		40% 
			transform: scale3d(.9, .9, .9)
		
		60% 
			opacity: 1
			transform: scale3d(1.03, 1.03, 1.03)
		
		80% 
			transform: scale3d(.97, .97, .97)		
		to 
			opacity: 1
			transform: scaleX(1)	

	.bounceIn 
		animation-name: bounceIn

	@keyframes bounceInDown 
		to 
			animation-timing-function: cubic-bezier(.215, .61, .355, 1)
		
		0% 
			opacity: 0
			transform: translate3d(0, -3000px, 0)
		
		60% 
			opacity: 1
			transform: translate3d(0, 25px, 0)
		
		75% 
			transform: translate3d(0, -10px, 0)
		
		90% 
			transform: translate3d(0, 5px, 0)		
		to 
			transform: none	

	.bounceInDown 
		animation-name: bounceInDown
	


	@keyframes bounceInLeft 
		to 
			animation-timing-function: cubic-bezier(.215, .61, .355, 1)
		
		0% 
			opacity: 0
			transform: translate3d(-3000px, 0, 0)
		
		60% 
			opacity: 1
			transform: translate3d(25px, 0, 0)
		
		75% 
			transform: translate3d(-10px, 0, 0)
		
		90% 
			transform: translate3d(5px, 0, 0)		
		to 
			transform: none	

	.bounceInLeft 
		animation-name: bounceInLeft

	@keyframes bounceInRight 
		to 
			animation-timing-function: cubic-bezier(.215, .61, .355, 1)
		
		0% 
			opacity: 0
			transform: translate3d(3000px, 0, 0)
		
		60% 
			opacity: 1
			transform: translate3d(-25px, 0, 0)
		
		75% 
			transform: translate3d(10px, 0, 0)
		
		90% 
			transform: translate3d(-5px, 0, 0)		
		to 
			transform: none	

	.bounceInRight 
		animation-name: bounceInRight

	@keyframes bounceInUp 
		to 
			animation-timing-function: cubic-bezier(.215, .61, .355, 1)
		
		0% 
			opacity: 0
			transform: translate3d(0, 3000px, 0)
		
		60% 
			opacity: 1
			transform: translate3d(0, -20px, 0)
		
		75% 
			transform: translate3d(0, 10px, 0)
		
		90% 
			transform: translate3d(0, -5px, 0)		
		to 
			transform: translateZ(0)	

	.bounceInUp 
		animation-name: bounceInUp

	@keyframes bounceOut 
		20% 
			transform: scale3d(.9, .9, .9)
		
		55% 
			opacity: 1
			transform: scale3d(1.1, 1.1, 1.1)		
		to 
			opacity: 0
			transform: scale3d(.3, .3, .3)	

	.bounceOut 
		animation-name: bounceOut

	@keyframes bounceOutDown 
		20% 
			transform: translate3d(0, 10px, 0)
		
		45% 
			opacity: 1
			transform: translate3d(0, -20px, 0)		
		to 
			opacity: 0
			transform: translate3d(0, 2000px, 0)	

	.bounceOutDown 
		animation-name: bounceOutDown

	@keyframes bounceOutLeft 
		20% 
			opacity: 1
			transform: translate3d(20px, 0, 0)		
		to 
			opacity: 0
			transform: translate3d(-2000px, 0, 0)	

	.bounceOutLeft 
		animation-name: bounceOutLeft

	@keyframes bounceOutRight 
		20% 
			opacity: 1
			transform: translate3d(-20px, 0, 0)		
		to 
			opacity: 0
			transform: translate3d(2000px, 0, 0)	

	.bounceOutRight 
		animation-name: bounceOutRight

	@keyframes bounceOutUp 
		20% 
			transform: translate3d(0, -10px, 0)
		
		45% 
			opacity: 1
			transform: translate3d(0, 20px, 0)		
		to 
			opacity: 0
			transform: translate3d(0, -2000px, 0)	

	.bounceOutUp 
		animation-name: bounceOutUp

	@keyframes fadeIn 
		0% 
			opacity: 0		
		to 
			opacity: 1	

	.fadeIn 
		animation-name: fadeIn

	@keyframes fadeInDown 
		0% 
			opacity: 0
			transform: translate3d(0, -100%, 0)		
		to 
			opacity: 1
			transform: none	

	.fadeInDown 
		animation-name: fadeInDown

	@keyframes fadeInDownBig 
		0% 
			opacity: 0
			transform: translate3d(0, -2000px, 0)		
		to 
			opacity: 1
			transform: none	

	.fadeInDownBig 
		animation-name: fadeInDownBig

	@keyframes fadeInLeft 
		0% 
			opacity: 0
			transform: translate3d(-100%, 0, 0)		
		to 
			opacity: 1
			transform: none	

	.fadeInLeft 
		animation-name: fadeInLeft

	@keyframes fadeInLeftBig 
		0% 
			opacity: 0
			transform: translate3d(-2000px, 0, 0)		
		to 
			opacity: 1
			transform: none	

	.fadeInLeftBig 
		animation-name: fadeInLeftBig

	@keyframes fadeInRight 
		0% 
			opacity: 0
			transform: translate3d(100%, 0, 0)		
		to 
			opacity: 1
			transform: none	

	.fadeInRight 
		animation-name: fadeInRight

	@keyframes fadeInRightBig 
		0% 
			opacity: 0
			transform: translate3d(2000px, 0, 0)		
		to 
			opacity: 1
			transform: none	

	.fadeInRightBig 
		animation-name: fadeInRightBig

		
	@keyframes fadeInUp 
		0% 
			opacity: 0
			transform: translate3d(0, 100%, 0)		
		to 
			opacity: 1
			transform: none	

	.fadeInUp 
		animation-name: fadeInUp

	@keyframes fadeInUpBig 
		0% 
			opacity: 0
			transform: translate3d(0, 2000px, 0)		
		to 
			opacity: 1
			transform: none	

	.fadeInUpBig 
		animation-name: fadeInUpBig

	@keyframes fadeOut 
		0% 
			opacity: 1		
		to 
			opacity: 0	

	.fadeOut 
		animation-name: fadeOut

	@keyframes fadeOutDown 
		0% 
			opacity: 1		
		to 
			opacity: 0
			transform: translate3d(0, 100%, 0)	

	.fadeOutDown 
		animation-name: fadeOutDown

	@keyframes fadeOutDownBig 
		0% 
			opacity: 1		
		to 
			opacity: 0
			transform: translate3d(0, 2000px, 0)	

	.fadeOutDownBig 
		animation-name: fadeOutDownBig

	@keyframes fadeOutLeft 
		0% 
			opacity: 1		
		to 
			opacity: 0
			transform: translate3d(-100%, 0, 0)	

	.fadeOutLeft 
		animation-name: fadeOutLeft

	@keyframes fadeOutLeftBig 
		0% 
			opacity: 1		
		to 
			opacity: 0
			transform: translate3d(-2000px, 0, 0)	

	.fadeOutLeftBig 
		animation-name: fadeOutLeftBig

	@keyframes fadeOutRight 
		0% 
			opacity: 1		
		to 
			opacity: 0
			transform: translate3d(100%, 0, 0)	

	.fadeOutRight 
		animation-name: fadeOutRight

	@keyframes fadeOutRightBig 
		0% 
			opacity: 1		
		to 
			opacity: 0
			transform: translate3d(2000px, 0, 0)	

	.fadeOutRightBig 
		animation-name: fadeOutRightBig

	@keyframes fadeOutUp 
		0% 
			opacity: 1		
		to 
			opacity: 0
			transform: translate3d(0, -100%, 0)

	.fadeOutUp 
		animation-name: fadeOutUp
	
	@keyframes moveUp 
		to 
			transform: translate3d(0, -70px, 0)	

	.moveUp 
		animation-name: moveUp

	@keyframes fadeOutUpBig 
		0% 
			opacity: 1		
		to 
			opacity: 0
			transform: translate3d(0, -2000px, 0)	

	.fadeOutUpBig 
		animation-name: fadeOutUpBig
	


	@keyframes flip 
		0% 
			transform: perspective(400px) rotateY(-1turn)
		
		40% 
			animation-timing-function: ease-out
		
		40% 
			transform: perspective(400px) translateZ(150px) rotateY(-190deg)
		
		50% 
			transform: perspective(400px) translateZ(150px) rotateY(-170deg)
		
		80% 
			animation-timing-function: ease-in
		
		80% 
			transform: perspective(400px) scale3d(.95, .95, .95)		
		to 
			transform: perspective(400px)
			animation-timing-function: ease-in	

	.animated.flip 
		backface-visibility: visible
		animation-name: flip

	@keyframes flipInX 
		0% 
			transform: perspective(400px) rotateX(90deg)
			opacity: 0
		
		40% 
			animation-timing-function: ease-in
		
		40% 
			transform: perspective(400px) rotateX(-20deg)
		
		60% 
			transform: perspective(400px) rotateX(10deg)
			opacity: 1
		
		80% 
			transform: perspective(400px) rotateX(-5deg)		
		to 
			transform: perspective(400px)	

	.flipInX 
		backface-visibility: visible
		animation-name: flipInX

	@keyframes flipInY 
		0% 
			transform: perspective(400px) rotateY(90deg)
			opacity: 0
		
		40% 
			animation-timing-function: ease-in
		
		40% 
			transform: perspective(400px) rotateY(-20deg)
		
		60% 
			transform: perspective(400px) rotateY(10deg)
			opacity: 1
		
		80% 
			transform: perspective(400px) rotateY(-5deg)		
		to 
			transform: perspective(400px)	

	.flipInY 
		backface-visibility: visible
		animation-name: flipInY

	@keyframes flipOutX 
		0% 
			transform: perspective(400px)
		
		30% 
			transform: perspective(400px) rotateX(-20deg)
			opacity: 1		
		to 
			transform: perspective(400px) rotateX(90deg)
			opacity: 0	

	.flipOutX 
		animation-name: flipOutX
		backface-visibility: visible

	@keyframes flipOutY 
		0% 
			transform: perspective(400px)
		
		30% 
			transform: perspective(400px) rotateY(-15deg)
			opacity: 1		
		to 
			transform: perspective(400px) rotateY(90deg)
			opacity: 0	

	.flipOutY 
		backface-visibility: visible
		animation-name: flipOutY

	@keyframes lightSpeedIn 
		0% 
			transform: translate3d(100%, 0, 0) skewX(-30deg)
			opacity: 0
		
		60% 
			transform: skewX(20deg)
		
		80% 
			opacity: 1
		
		80% 
			transform: skewX(-5deg)		
		to 
			transform: none
			opacity: 1	

	.lightSpeedIn 
		animation-name: lightSpeedIn
		animation-timing-function: ease-out

	@keyframes lightSpeedOut 
		0% 
			opacity: 1		
		to 
			transform: translate3d(100%, 0, 0) skewX(30deg)
			opacity: 0	

	.lightSpeedOut 
		animation-name: lightSpeedOut
		animation-timing-function: ease-in

	@keyframes rotateIn 
		0% 
			transform-origin: center
			transform: rotate(-200deg)
			opacity: 0
		to 
			transform-origin: center
			transform: none
			opacity: 1	

	.rotateIn 
		animation-name: rotateIn
	


	@keyframes rotateInDownLeft 
		0% 
			transform-origin: left bottom
			transform: rotate(-45deg)
			opacity: 0
		to 
			transform-origin: left bottom
			transform: none
			opacity: 1	

	.rotateInDownLeft 
		animation-name: rotateInDownLeft

	@keyframes rotateInDownRight 
		0% 
			transform-origin: right bottom
			transform: rotate(45deg)
			opacity: 0
		to 
			transform-origin: right bottom
			transform: none
			opacity: 1	

	.rotateInDownRight 
		animation-name: rotateInDownRight

	@keyframes rotateInUpLeft 
		0% 
			transform-origin: left bottom
			transform: rotate(45deg)
			opacity: 0
		to 
			transform-origin: left bottom
			transform: none
			opacity: 1
		

	.rotateInUpLeft 
		animation-name: rotateInUpLeft

	@keyframes rotateInUpRight 
		0% 
			transform-origin: right bottom
			transform: rotate(-90deg)
			opacity: 0
		to 
			transform-origin: right bottom
			transform: none
			opacity: 1	

	.rotateInUpRight 
		animation-name: rotateInUpRight

	@keyframes rotateOut 
		0% 
			transform-origin: center
			opacity: 1
		to 
			transform-origin: center
			transform: rotate(200deg)
			opacity: 0	

	.rotateOut 
		animation-name: rotateOut

	@keyframes rotateOutDownLeft 
		0% 
			transform-origin: left bottom
			opacity: 1
		to 
			transform-origin: left bottom
			transform: rotate(45deg)
			opacity: 0
		


	.rotateOutDownLeft 
		animation-name: rotateOutDownLeft

	@keyframes rotateOutDownRight 
		0% 
			transform-origin: right bottom
			opacity: 1
		to 
			transform-origin: right bottom
			transform: rotate(-45deg)
			opacity: 0	

	.rotateOutDownRight 
		animation-name: rotateOutDownRight

	@keyframes rotateOutUpLeft 
		0% 
			transform-origin: left bottom
			opacity: 1
		to 
			transform-origin: left bottom
			transform: rotate(-45deg)
			opacity: 0	

	.rotateOutUpLeft 
		animation-name: rotateOutUpLeft

	@keyframes rotateOutUpRight 
		0% 
			transform-origin: right bottom
			opacity: 1
		to 
			transform-origin: right bottom
			transform: rotate(90deg)
			opacity: 0	

	.rotateOutUpRight 
		animation-name: rotateOutUpRight

	@keyframes hinge 
		0% 
			transform-origin: top left
		
		60% 
			animation-timing-function: ease-in-out
		
		60% 
			transform: rotate(80deg)
			transform-origin: top left
		
		80% 
			transform: rotate(60deg)
			transform-origin: top left
			animation-timing-function: ease-in-out
			opacity: 1		
		to 
			transform: translate3d(0, 700px, 0)
			opacity: 0	

	.hinge 
		animation-name: hinge

	@keyframes rollIn 
		0% 
			opacity: 0
			transform: translate3d(-100%, 0, 0) rotate(-120deg)		
		to 
			opacity: 1
			transform: none	

	.rollIn 
		animation-name: rollIn

	@keyframes rollOut 
		0% 
			opacity: 1		
		to 
			opacity: 0
			transform: translate3d(100%, 0, 0) rotate(120deg)	

	.rollOut 
		animation-name: rollOut

	@keyframes zoomIn 
		0% 
			opacity: 0
			transform: scale3d(.3, .3, .3)
		
		50% 
			opacity: 1	

	.zoomIn 
		animation-name: zoomIn

	@keyframes zoomInDown 
		0% 
			opacity: 0
			transform: scale3d(.1, .1, .1) translate3d(0, -1000px, 0)
			animation-timing-function: cubic-bezier(.55, .055, .675, .19)
		
		60% 
			opacity: 1
			transform: scale3d(.475, .475, .475) translate3d(0, 60px, 0)
			animation-timing-function: cubic-bezier(.175, .885, .32, 1)	

	.zoomInDown 
		animation-name: zoomInDown

	@keyframes zoomInLeft 
		0% 
			opacity: 0
			transform: scale3d(.1, .1, .1) translate3d(-1000px, 0, 0)
			animation-timing-function: cubic-bezier(.55, .055, .675, .19)
		
		60% 
			opacity: 1
			transform: scale3d(.475, .475, .475) translate3d(10px, 0, 0)
			animation-timing-function: cubic-bezier(.175, .885, .32, 1)
		


	.zoomInLeft 
		animation-name: zoomInLeft

	@keyframes zoomInRight 
		0% 
			opacity: 0
			transform: scale3d(.1, .1, .1) translate3d(1000px, 0, 0)
			animation-timing-function: cubic-bezier(.55, .055, .675, .19)
		
		60% 
			opacity: 1
			transform: scale3d(.475, .475, .475) translate3d(-10px, 0, 0)
			animation-timing-function: cubic-bezier(.175, .885, .32, 1)	

	.zoomInRight 
		animation-name: zoomInRight

	@keyframes zoomInUp 
		0% 
			opacity: 0
			transform: scale3d(.1, .1, .1) translate3d(0, 1000px, 0)
			animation-timing-function: cubic-bezier(.55, .055, .675, .19)
		
		60% 
			opacity: 1
			transform: scale3d(.475, .475, .475) translate3d(0, -60px, 0)
			animation-timing-function: cubic-bezier(.175, .885, .32, 1)	

	.zoomInUp 
		animation-name: zoomInUp

	@keyframes zoomOut 
		0% 
			opacity: 1
		
		50% 
			transform: scale3d(.3, .3, .3)		
		to 
			opacity: 0	

	.zoomOut 
		animation-name: zoomOut

	@keyframes zoomOutDown 
		40% 
			opacity: 1
			transform: scale3d(.475, .475, .475) translate3d(0, -60px, 0)
			animation-timing-function: cubic-bezier(.55, .055, .675, .19)		
		to 
			opacity: 0
			transform: scale3d(.1, .1, .1) translate3d(0, 2000px, 0)
			transform-origin: center bottom
			animation-timing-function: cubic-bezier(.175, .885, .32, 1)	

	.zoomOutDown 
		animation-name: zoomOutDown

	@keyframes zoomOutLeft 
		40% 
			opacity: 1
			transform: scale3d(.475, .475, .475) translate3d(42px, 0, 0)		
		to 
			opacity: 0
			transform: scale(.1) translate3d(-2000px, 0, 0)
			transform-origin: left center	

	.zoomOutLeft 
		animation-name: zoomOutLeft

	@keyframes zoomOutRight 
		40% 
			opacity: 1
			transform: scale3d(.475, .475, .475) translate3d(-42px, 0, 0)		
		to 
			opacity: 0
			transform: scale(.1) translate3d(2000px, 0, 0)
			transform-origin: right center	

	.zoomOutRight 
		animation-name: zoomOutRight
	


	@keyframes zoomOutUp 
		40% 
			opacity: 1
			transform: scale3d(.475, .475, .475) translate3d(0, 60px, 0)
			animation-timing-function: cubic-bezier(.55, .055, .675, .19)		
		to 
			opacity: 0
			transform: scale3d(.1, .1, .1) translate3d(0, -2000px, 0)
			transform-origin: center bottom
			animation-timing-function: cubic-bezier(.175, .885, .32, 1)	

	.zoomOutUp 
		animation-name: zoomOutUp

	@keyframes slideInDown 
		0% 
			transform: translate3d(0, -100%, 0)
			visibility: visible		
		to 
			transform: translateZ(0)	

	.slideInDown 
		animation-name: slideInDown

	@keyframes slideInLeft 
		0% 
			transform: translate3d(-100%, 0, 0)
			visibility: visible		
		to 
			transform: translateZ(0)	

	.slideInLeft 
		animation-name: slideInLeft

	@keyframes slideInRight 
		0% 
			transform: translate3d(100%, 0, 0)
			visibility: visible		
		to 
			transform: translateZ(0)	

	.slideInRight 
		animation-name: slideInRight

	@keyframes slideInUp 
		0% 
			transform: translate3d(0, 100%, 0)
			visibility: visible		
		to 
			transform: translateZ(0)	

	.slideInUp 
		animation-name: slideInUp

	@keyframes slideOutDown 
		0% 
			transform: translateZ(0)		
		to 
			visibility: hidden
			transform: translate3d(0, 100%, 0)	

	.slideOutDown 
		animation-name: slideOutDown

	@keyframes slideOutLeft 
		0% 
			transform: translateZ(0)		
		to 
			visibility: hidden
			transform: translate3d(-100%, 0, 0)	

	.slideOutLeft 
		animation-name: slideOutLeft

	@keyframes slideOutRight 
		0% 
			transform: translateZ(0)		
		to 
			visibility: hidden
			transform: translate3d(100%, 0, 0)	

	.slideOutRight 
		animation-name: slideOutRight

	@keyframes slideOutUp 
		0% 
			transform: translateZ(0)		
		to 
			visibility: hidden
			transform: translate3d(0, -100%, 0)

	.slideOutUp 
		animation-name: slideOutUp
	

