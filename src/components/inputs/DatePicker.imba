import Flatpickr from "flatpickr"

export default tag DatePicker
	def mount
		flatpicker = Flatpickr($input, {
			enableTime: true,
			altInput: true,
			dateFormat: 'Z',
			altFormat: 'd/m/Y - h:i K',
			defaultDate: Date.new(data or Date.new).toJSON()
			parseDate: do |date| Date.new(date)
		})

	def unmount
		flatpicker.destroy()

	<self>
		<input$input bind=data .form-control .form-control-lg>