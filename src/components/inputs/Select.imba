import {v4} from 'uuid'

export default tag Select
	prop id = v4()
	prop search
	prop options = []
	prop placeholder = 'Select'
	prop value

	def mount
		rect = self.getBoundingClientRect()
		click_handler = handleClick.bind(this)
		resize_handler = handleResize.bind(this)
		scroll_handler = scrollHandler.bind(this)
		window.addEventListener('resize', resize_handler)
		window.addEventListener('scroll', scroll_handler)
		render()

	def clickDropdown element
		return true if (element.id == id) 
		element.parentNode and clickDropdown(element.parentNode)

	def scrollHandler e
		render()

	def handleClick e
		unless clickDropdown(e.target)
			toggle()

	def handleResize
		rect = self.getBoundingClientRect()
		render()

	def toggle
		dropdown = !dropdown
		if dropdown
			document.addEventListener('pointerdown', click_handler, false)
		else
			document.removeEventListener('pointerdown', click_handler, false)

	def selectOption opt
		value = opt.value
		emit('change', value)
		toggle()

	def dropdownStyle
		let y = rect.height + rect.top - window.scrollY
		let x = rect.left - window.scrollX
		"z-index: 100; position: fixed; top: calc({y}px + 0.9em); left: {x}px;"

	<self>
		<span @click.toggle .select2.select2-container.select2-container--default dir="ltr" style="width: 100%;">
			<span.selection>
				<span.select2-selection.select2-selection--single tabindex="0">
					<span.select2-selection__rendered title="Subaru"> (options.find(do $1.value == value) or {}).option or placeholder
					<span.select2-selection__arrow role="presentation">
						<b role="presentation">
			<span.dropdown-wrapper aria-hidden="true">
		if dropdown
			<span #{id} .select2-container.select2-container--default.select2-container--open style=dropdownStyle()>
				<span.select2-dropdown.select2-dropdown--below dir="ltr" style="width: auto; min-width: {rect.width}px; position: relative;">
					if search
						<span.select2-search.select2-search--dropdown>
							<input.select2-search__field type="search" tabindex="0" autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false" role="textbox">


					if options.length
						<span.select2-results>
							<ul.select2-results__options role="tree" aria-expanded="true" aria-hidden="false">
								for opt in options
									<li :click.selectOption(opt)
										.select2-results__option
										.select2-results__option--highlighted=(opt.value == value) 
										aria-selected=(opt.value == value) 
										role="treeitem"> opt.option
					else
						<span.select2-results>
							<ul.select2-results__options role="tree" aria-expanded="true" aria-hidden="false">
								<li role="treeitem" [ta: center]> 'Empty'
