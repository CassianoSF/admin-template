import Show from "./crud_pages/Show"
import Index from "./crud_pages/Index"
import Form from "./crud_pages/Form"

export default tag Crud
	prop model

	<self .fadeIn .animated>
		if Router.to('/(new|edit)')
			<Form model=model>
		elif Router.to('/[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}')
			<Show model=model>
		else
			<Index model=model>
