import ConvertCase from 'js-convert-case'
import {Confirm} from "../components/ui/Confirm"
import Show from "./crud_pages/Show"
import Index from "./crud_pages/Index"
import Form from "./crud_pages/Form"

export default tag Crud
	prop records = []
	prop relations = {}
	prop model
	prop target
	prop confirm

	def mount
		target = null
		loadRecords()
	
	def loadRecords
		records = await model.all()
		relations = {}
		if model.belongs_to
			for own rel, meta of model.inputs
				continue unless meta.type.prototype instanceof Record
				relations[rel] = await meta.type.all()
		console.log records
		render()

	def addRecord
		target = new model

	def closeForm
		target = null
		loadRecords()

	def select rec
		Router.go("/{model.name.toLowerCase()}/" + rec.id)

	def delete e
		confirm = e.detail
		render()

	def edit e
		target = e.detail

	def destroy
		confirm.delete()
		let index = records.indexOf(confirm)
		records.splice(index, 1)
		confirm = null
		STATE.alerts.push(type: 'success', msg: I18n.t.pages.crud.success_destroy)
		render()

	def confirmClose
		confirm = false

	<self .fadeIn>
		if confirm
			<Confirm :submit.destroy :close.confirmClose message=I18n.t.pages.crud.confirm>
		if Router.path.slice(-1) != ConvertCase.toSnakeCase(model.name).toLowerCase()
			<Show model=model>
		elif target
			<Form :close.closeForm model=model target=target relations=relations>
		else
			<Index records=records model=model :add.addRecord :delete.delete :edit.edit>
