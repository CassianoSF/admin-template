import Show from "./crud_pages/Show"
import Index from "./crud_pages/Index"
import Form from "./crud_pages/Form"

export default tag Crud
	prop model

	def addModel
		Router.go("/{model.singular_name}/new")

	def closeForm
		Router.go("/{model.singular_name}")

	def select rec
		Router.go("/{model.singular_name}/" + rec.id)

	def edit e
		Router.go("/{model.singular_name}/edit/" + e.detail.id)

	<self .fadeIn>
		if Router.to(model.singular_name + '/[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{12}')
			<Show model=model>
		elif Router.to(model.singular_name + '/(new|edit)')
			<Form :close.closeForm model=model >
		else
			<Index model=model :add.addModel :delete.delete :edit.edit>
