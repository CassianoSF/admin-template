import Show from "./crud_pages/Show"
import Index from "./crud_pages/Index"
import Form from "./crud_pages/Form"

export default tag Crud
	prop model

	<self .fadeIn>
		if Router.to(model.singular_name + '/[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{12}')
			<Show model=model>
		elif Router.to(model.singular_name + '/(new|edit)')
			<Form model=model>
		else
			<Index model=model>
