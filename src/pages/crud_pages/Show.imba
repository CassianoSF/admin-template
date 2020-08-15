import Confirm from "../../components/ui/Confirm"
import ConvertCase from 'js-convert-case'

export default tag Show
	prop target
	prop model

	def mount
		id = Router.path.slice(-1)
		target = await model.find(id)
		render()

	def destroy
		await target.delete()
		confirm = false
		STATE.alerts.push(type: 'success', msg: I18n.t.pages.crud.success_destroy)
		Router.go("/{model.singular_name}/")

	def confirmClose
		confirm = false

	def confirmOpen
		confirm = true

	def edit
		Router.go("/{model.singular_name}/edit/{target.id}")

	def back
		Router.go("/{model.singular_name}/")

	<self .animated .fadeIn>
		if confirm
			<Confirm :submit.destroy :close.confirmClose message=I18n.t.pages.crud.confirm>
		<header .content__title>
			<h1> 
				<a :click=(Router.go("/"))> 'Home'
				<i[mx: 10px] .zmdi .zmdi-chevron-right .zmdi-hc-lg>
				<a :click=(Router.go("/{model.singular_name}"))> I18n.t.models[model.plural_name].plural_name
				<i[mx: 10px] .zmdi .zmdi-chevron-right .zmdi-hc-lg>
				if target
					target.main_field 
				<div [float@md: right my@lt-md: 2rem]>
					<buttom[mr: 1rem] :click.back .btn .btn-dark> 'Voltar'
					<buttom[mr: 1rem] :click.edit .btn .btn-primary> 'Editar'
					<buttom[mr: 1rem] :click.confirmOpen .btn .btn-danger> 'Excluir'
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

			if (target or {}).permissions
				<div .col-12>
					<PermissionShow permissions=target.permissions> 


tag PermissionShow
	<self>
		<header .content__title>
			<h1> I18n.t.models.permissions.plural_name
		<div.card>
			<div.card-body>
				<.listview>
					for permission in permissions
						<.row [p: 1rem border-bottom: 1px solid rgba(255,255,255,0.2)]>
							<.col-md-2>
								<div .listview__heading> I18n.t.models[permission.model].plural_name
							<.col-md-1>
								<label .custom-control .custom-checkbox .align-self-start>
									<input disabled bind=permission.see type="checkbox" .custom-control-input>
									<span .custom-control-indicator>
									<span .custom-control-description> I18n.t.models.permissions.fields.see
							<.col-md-1>
								<label .custom-control .custom-checkbox .align-self-start>
									<input disabled bind=permission.add type="checkbox" .custom-control-input>
									<span .custom-control-indicator>
									<span .custom-control-description> I18n.t.models.permissions.fields.add
							<.col-md-1>
								<label .custom-control .custom-checkbox .align-self-start>
									<input disabled bind=permission.edit type="checkbox" .custom-control-input>
									<span .custom-control-indicator>
									<span .custom-control-description> I18n.t.models.permissions.fields.edit
							<.col-md-1>
								<label .custom-control .custom-checkbox .align-self-start>
									<input disabled bind=permission.remove type="checkbox" .custom-control-input>
									<span .custom-control-indicator>
									<span .custom-control-description> I18n.t.models.permissions.fields.remove
							<.col-md-1>
								<label .custom-control .custom-checkbox .align-self-start>
									<input disabled bind=permission.access type="checkbox" .custom-control-input>
									<span .custom-control-indicator>
									<span .custom-control-description> I18n.t.models.permissions.fields.access
							<.col-md-1>
								<label .custom-control .custom-checkbox .align-self-start>
									<input disabled bind=permission.access type="checkbox" .custom-control-input>
									<span .custom-control-indicator>
									<span .custom-control-description> I18n.t.models.permissions.fields.access
