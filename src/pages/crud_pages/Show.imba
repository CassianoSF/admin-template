import ConvertCase from 'js-convert-case'
import CrudPacoteRecebimento from '../../components/custom/CrudPacoteRecebimento'


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
				<i[mx: 10px] .zmdi .zmdi-chevron-right .zmdi-hc-lg>
				<a :click=(Router.go("/{model.singular_name}"))> I18n.t.models[model.plural_name].plural_name
				<i[mx: 10px] .zmdi .zmdi-chevron-right .zmdi-hc-lg>
				if target
					console.log target
					target.main_field 
		<div[mb: 40px] .row>
			if target
				for own field, type of model.show
					<div .col-md-4>
						<div[p: 20px] .card>
							if Model.models[type]
								<div .card-title> target[field].main_field
								<p .card-subtitle> I18n.t.models[Model.models[type].plural_name].human_name
							else
								<div .card-title> target[field]
								<p .card-subtitle> I18n.t.models[model.plural_name].fields[field]

		if model == Recebimento
			<header .content__title>
				<h1> 
					'Carros de Incubação'
			<CrudPacoteRecebimento recebimento=target>
