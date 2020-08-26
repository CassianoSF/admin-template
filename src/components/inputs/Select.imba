export default tag Select
	prop options
	prop active
	prop search
	prop placeholder
	prop search_value
	prop searched_options
	prop customSearch
	prop onScroll
	prop loading

	def mount
		searched_options = options

	def open
		active = true
		$search-input.focus()

	def toggle
		active = !active

	def select op
		data = op.value
		toggle()

	def selected
		for op in options
			return op.text if op.value == data
		return null

	def onSearch
		return customSearch(search_value, self) if customSearch
		let text = search_value.normalize('NFD')

		if !text
			searched_options = options 
			return

		let regex = ''
		for letter in text
			regex = regex.concat(".*?{letter}")
		regex = RegExp.new(regex, 'i')

		searched_options = []

		for op in options
			let result = op.text.normalize('NFD').match(regex)
			searched_options.push(op) if result

	def customOnScroll e
		onScroll(e, self) if onScroll

	<self>
		<div .select-box>
			<div[w: inherit]>
				<div .dropdown .active=(active)>
					if search
						<div .search>
							<i .search-icon .zmdi .zmdi-search>
							<input$search-input bind=search_value :keyup.onSearch>
					<div .options-container :scroll.customOnScroll>
						for op in searched_options
							<div .option :click.select(op)>
								op.text
								<i [float: right right: 20px] .zmdi .zmdi-check> if data == op.value
						if loading
							<div .option [ta: center]>
								<i .zmdi .zmdi-spinner .zmdi-hc-spin>

				<div .selected :click.toggle>
					selected() or placeholder or 'Select'
					<i .arrow .up=(active) .zmdi .zmdi-chevron-down>

	css .search-icon
		color: rgba(255,255,255,0.8) 
		fs: 20px 
		px: 18px 
		py: 15px

	css .options-container
		max-height: 175px 
		overflow-y: scroll

	css .search
		border-bottom: 1px solid rgba(255,255,255,0.2)

	css $search-input
		height: 55px
		background-color: black
		color: white
		font-size: 15px
		transform: translate(0,-2px)
		border-bottom: none

	css .select-box 
		display: flex
		width: 100%
		flex-direction: column

	css .select-box .dropdown
		position: absolute
		transform: translate(0, 38px)
		background: black
		color: white
		max-height: 0
		width: inherit
		opacity: 0
		transition: all 0.2s
		border-radius: 1px
		overflow: hidden
		order: 1
		z-index: 100

	css .selected 
		background: rgba(0,0,0,0)
		border-radius: 1px
		border-bottom: 1px solid rgba(255,255,255,0.2)
		color: white
		position: relative
		order: 0

	css .selected@after 
		content: ""
		position: absolute
		height: 100%
		width: 32px
		right: 10px
		top: 5px
		transition: all 0.2s

	css .select-box .dropdown.active 
		max-height: 240px
		opacity: 1

	css .select-box .dropdown.active + .selected@after 
		transform: rotateX(180deg)
		top: -6px

	css .select-box .dropdown@-webkit-scrollbar 
		width: 8px
		background: #0d141f
		border-radius: 0 8px 8px 0

	css .select-box .dropdown@-webkit-scrollbar-thumb 
		background: rgba(255,255,255,0.1)
		border-radius: 0 8px 8px 0

	css .selected 
		padding: 8px 2px
		font-size: 15px
		cursor: pointer

	css .select-box .option
		padding: 8px 24px
		font-size: 15px
		cursor: pointer

	css .arrow
		float: right
		margin-right: 10px
		font-size: 25px
		transition: all 0.2s

	css .up
		transform: scaleY(-1)

	css .select-box .option@hover 
		background: rgba(255,255,255,0.1)

	css .select-box label
		cursor: pointer

	css .select-box .option .radio 
		display: none

