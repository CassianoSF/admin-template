import Flatpickr from "flatpickr"

export default tag DatePicker
	prop value

	def mount
		console.log value
		render()
		flatpicker = Flatpickr($input, {
			enableTime: true,
			altInput: true,
			dateFormat: 'Z',
			altFormat: 'd/m/Y - h:i K',
			defaultDate: Date.new(value).toJSON()
			parseDate: do |date| Date.new(date)
		})

	def onChange e
		console.log e

	def unmount
		flatpicker.destroy()

	<self>
		<input$input bind=value
			.form-control 
			.form-control-lg>