export default tag Pagination
	def change_page page
		return if page < 0
		return if page >= data.page_count
		emit('change', page)

	def from
		data.current_page * data.per_page + 1

	def to
		let end = (data.current_page + 1) * data.per_page
		if end > data.record_count
			return data.record_count
		else
			return end

	def render
		<self>
			<div.pagination-container>
				<div .dataTables_info>
					if data.record_count
						"Mostrando {from()} a {to()} de {data.record_count} registros"
					else
						"Nenhum registro encontrado"


				<div .dataTables_paginate .paging_simple_numbers>
					if data.page_count <= 6
						<a :click=(do change_page(data.current_page - 1)) .paginate_button .previous .disabled=(data.current_page == 0)>
							"Anterior"
						for i in Array.from(Array(data.page_count).keys())
							<a :click=(do change_page(i)) .paginate_button .current=(data.current_page == i)>
								i+1
						<a :click=(do change_page(data.current_page + 1)) .paginate_button .next .disabled=(data.current_page == (data.page_count - 1))>
							"Proximo"
							
					elif data.current_page < 3
						<a :click=(do change_page(data.current_page - 1)) .paginate_button .previous .disabled=(data.current_page == 0)>
							"Anterior"
						<a :click=(do change_page(0)) .paginate_button .current=(data.current_page == 0)>
							"1"
						<a :click=(do change_page(1)) .paginate_button .current=(data.current_page == 1)>
							"2"
						<a :click=(do change_page(2)) .paginate_button .current=(data.current_page == 2)>
							"3"
						<a :click=(do change_page(3)) .paginate_button>
							"4"
						<a :click=(do change_page(4)) .paginate_button>
							"..."
						<a :click=(do change_page(data.page_count - 1)) .paginate_button>
							data.page_count
						<a :click=(do change_page(data.current_page + 1)) .paginate_button .next>
							"Proximo"


					elif data.current_page >= 3 and data.current_page <= data.page_count - 4
						<a :click=(do change_page(data.current_page - 1)) .paginate_button .previous>
							"Anterior"
						<a :click=(do change_page(0)) .paginate_button>
							"1"
						<a :click=(do change_page(data.current_page - 3)) .paginate_button>
							"..."
						<a :click=(do change_page(data.current_page - 2)) .paginate_button>
							"{data.current_page - 1}"
						<a :click=(do change_page(data.current_page - 1)) .paginate_button>
							"{data.current_page}"
						<a :click=(do change_page(data.current_page)) .paginate_button .current>
							"{data.current_page + 1}"
						<a :click=(do change_page(data.current_page + 1)) .paginate_button>
							"{data.current_page + 2}"
						<a :click=(do change_page(data.current_page + 2)) .paginate_button>
							"{data.current_page + 3}"
						<a :click=(do change_page(data.current_page + 3)) .paginate_button>
							"..."
						<a :click=(do change_page(data.page_count - 1)) .paginate_button>
							data.page_count
						<a :click=(do change_page(data.current_page + 1)) .paginate_button .next>
							"Proximo"

					elif data.current_page > data.page_count - 4
						<a :click=(do change_page(data.current_page - 1)) .paginate_button .previous>
							"Anterior"
						<a :click=(do change_page(0)) .paginate_button>
							"1"
						<a :click=(do change_page(data.page_count - 5)) .paginate_button>
							"..."
						<a :click=(do change_page(data.page_count - 4)) .paginate_button .current=(data.current_page == (-4 + data.page_count))>
							data.page_count - 3
						<a :click=(do change_page(data.page_count - 3)) .paginate_button .current=(data.current_page == (-3 + data.page_count))>
							data.page_count - 2
						<a :click=(do change_page(data.page_count - 2)) .paginate_button .current=(data.current_page == (-2 + data.page_count))>
							data.page_count - 1
						<a :click=(do change_page(data.page_count - 1)) .paginate_button .current=(data.current_page == (-1 + data.page_count))>
							data.page_count
						<a :click=(do change_page(data.current_page + 1)) .paginate_button .next .disabled=(data.current_page == data.page_count - 1)>
							"Proximo"

	css .pagination-container
		max-width: 95vw
		padding-bottom: 20px
		padding-top: 20px


	css a
		-webkit-touch-callout: none
		-webkit-user-select: none
		-khtml-user-select: none
		-moz-user-select: none
		-ms-user-select: none
		user-select: none

	css .dataTables_paginate
		text-align: center

	css .paginate_button
		background-color: rgba(255, 255, 255, .08)
		display: inline-block
		color: rgba(255, 255, 255, .85)
		vertical-align: top
		border-radius: 50%
		margin: 0 1px 0 2px
		font-size: 1rem
		cursor: pointer
		width: 2.5rem
		height: 2.5rem
		line-height: 2.5rem
		text-align: center
		transition: background-color .3s, color .3s

	css .paginate_button.current
		background-color: #fff
		color: #000
		cursor: default

	css .paginate_button@not(.current)@not(.disabled)@focus, .paginate_button@not(.current)@not(.disabled)@hover
		background-color: rgba(255, 255, 255, .2)
		color: rgba(255, 255, 255, .85)

	css .paginate_button.current, .paginate_button.disabled
		cursor: default

	css .paginate_button.next, .paginate_button.previous
		font-size: 0
		position: relative

	css .paginate_button.next@before, .paginate_button.previous@before
		font-family: Material-Design-Iconic-Font
		font-size: 1rem
		line-height: 2.55rem

	css .paginate_button.previous@before
		content: '\F2FF'

	css .paginate_button.next@before
		content: '\F301'
	
	css .paginate_button.disabled@focus, .paginate_button.disabled@hover
		color: rgba(255, 255, 255, .85)

	css .dataTables_info
		text-align: center
		padding: .5rem 0 .5rem
		font-size: .9rem
		color: rgba(255, 255, 255, .7)