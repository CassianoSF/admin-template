import ConvertCase from 'js-convert-case'

export default tag Show
	prop target
	prop model

	def mount
		id = Router.path.slice(-1)
		target = await model.find(id)
		render()

	<self .animated .fadeIn>
		<header .content__title>
			<h1> 
				<a :click=(Router.go("/"))> 'Home'
				<i[mx: 10px] .zmdi .zmdi-arrow-right>
				<a :click=(Router.go("/{ConvertCase.toSnakeCase(model.name).toLowerCase()}"))> I18n.t.models[model.table_name].plural_name
				<i[mx: 10px] .zmdi .zmdi-arrow-right>
				if target
					console.log target
					target.main_field 
		<div[mb: 40px] .row>
			if target
				for own field, meta of model.show
					<div .col-md-4>
						<div[p: 20px] .card>
							if meta.type.prototype instanceof Record
								<div .card-title> target[field].main_field
								<p .card-subtitle> I18n.t.models[meta.type.table_name].human_name
							else
								<div .card-title> target[field]
								<p .card-subtitle> I18n.t.models[model.table_name].fields[field]
