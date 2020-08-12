export default tag CrudPacoteRecebimento
	prop records = []
	prop target

	def render
		<self>
			<.row>
				<.col-md-4>
					<.card .card-add>
						<div .add-carro>
							<i .zmdi .zmdi-plus>
							" Adicionar Carro"

	css .card-add
		p:15px 
		background-color@hover: #28a745
		transition: 0.3s

	css .add-carro
		border-radius: 2px 
		fs: 15px 
		ta: center 
		border-style: dashed 
		border-width: 2px 
		border-color: rgba(255,255,255,0.5)
		p:15px



tag A
	<self>
		<slot>

tag B
	<self>
		<A>
			'oi'
