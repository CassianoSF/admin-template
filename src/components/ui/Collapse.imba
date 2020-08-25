
def @watch target,key,desc
	Object.defineProperty(target, key, {
		get: do this["${key}"]
		set: do |val| 
			if val != this["${key}"]
				this["${key}"] = val
				this.onChange()
			this["${key}"]		
	})

export default tag Collapse
	@watch prop open

	def onChange
		content = self.children[0]
		return unless content
		if open
			content.style.max-height = "{content.scrollHeight}px"
		else
			content.style.max-height = null
		render()

	<self>
		<div .collapse-content>
			<slot>

	css .collapse-content
		overflow: hidden
		max-height: 0
		transition: max-height .35s ease-out
