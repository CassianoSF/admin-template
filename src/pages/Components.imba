import {Select} from '../components/inputs/Select'

let options = [
	{option: 'Teste1', value: 1}
	{option: 'Teste2', value: 2}
	{option: 'Teste3', value: 3}
	{option: 'Teste4', value: 4}
]

export tag Components
	prop val = 1

	def changeSelect e
		val = e.detail
		render()

	<self>
		<header .content__title>
			<h1> 'Components'

		<Select value=val :change.changeSelect options=options>
		<.card>
			<.card-body>
				<.row>
					<.col-md-3>
						<Select value=val :change.changeSelect options=[]>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<button .btn .btn-primary :click.log(val)> "Log"
				<.row>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<button .btn .btn-primary :click.log(val)> "Log"
				<.row>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<button .btn .btn-primary :click.log(val)> "Log"
				<.row>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<button .btn .btn-primary :click.log(val)> "Log"
				<.row>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<button .btn .btn-primary :click.log(val)> "Log"
				<.row>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<button .btn .btn-primary :click.log(val)> "Log"
				<.row>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<button .btn .btn-primary :click.log(val)> "Log"
				<.row>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<button .btn .btn-primary :click.log(val)> "Log"
				<.row>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<button .btn .btn-primary :click.log(val)> "Log"
				<.row>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<button .btn .btn-primary :click.log(val)> "Log"
						
				<.row>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<button .btn .btn-primary :click.log(val)> "Log"
				<.row>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<button .btn .btn-primary :click.log(val)> "Log"
				<.row>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<button .btn .btn-primary :click.log(val)> "Log"
				<.row>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<button .btn .btn-primary :click.log(val)> "Log"
						
				<.row>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<button .btn .btn-primary :click.log(val)> "Log"
				<.row>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<button .btn .btn-primary :click.log(val)> "Log"
				<.row>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<button .btn .btn-primary :click.log(val)> "Log"
				<.row>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<button .btn .btn-primary :click.log(val)> "Log"
						
				<.row>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<button .btn .btn-primary :click.log(val)> "Log"
				<.row>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<button .btn .btn-primary :click.log(val)> "Log"
				<.row>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<button .btn .btn-primary :click.log(val)> "Log"
				<.row>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<button .btn .btn-primary :click.log(val)> "Log"
						
				<.row>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<button .btn .btn-primary :click.log(val)> "Log"
				<.row>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<button .btn .btn-primary :click.log(val)> "Log"
				<.row>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<button .btn .btn-primary :click.log(val)> "Log"
				<.row>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<button .btn .btn-primary :click.log(val)> "Log"
						
				<.row>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<button .btn .btn-primary :click.log(val)> "Log"
				<.row>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<button .btn .btn-primary :click.log(val)> "Log"
				<.row>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<button .btn .btn-primary :click.log(val)> "Log"
				<.row>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<Select value=val :change.changeSelect options=options>
					<.col-md-3>
						<button .btn .btn-primary :click.log(val)> "Log"
						
