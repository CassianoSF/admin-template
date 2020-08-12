export tag Home
	def changePage page
		Router.go(page)

	<self>
		<.row[p: 4vw]>
			<.col-4 @click.changePage('/lote') [p: 1px background-color@hover: rgba(0,0,0,0.4)]>
				<div .icon-card>
					<div .icon-card-body>
						<div[font-size: calc(10px + 5vw) ta: center]>
							<i .zmdi .zmdi-stackoverflow>
					<div[ta: center]>
						<div[font-size: calc(5px + 1.4vw)]> "Lotes"
			<.col-4 @click.changePage('/recebimento') [p: 1px background-color@hover: rgba(0,0,0,0.4)]>
				<div .icon-card>
					<div .icon-card-body>
						<div[font-size: calc(10px + 5vw) ta: center]>
							<i .zmdi .zmdi-truck>
					<div[ta: center]>
						<div[font-size: calc(5px + 1.4vw)]> "RECEBIMENTO"
			<.col-4 @click.changePage('/armazenamento') [p: 1px background-color@hover: rgba(0,0,0,0.4)]>
				<div .icon-card>
					<div .icon-card-body>
						<div[font-size: calc(10px + 5vw) ta: center]>
							<i .zmdi .zmdi-dropbox>
					<div[ta: center]>
						<div[font-size: calc(5px + 1.4vw)]> "ARMAZENAMENTO"
			<.col-4 @click.changePage('/incubacao') [p: 1px background-color@hover: rgba(0,0,0,0.4)]>
				<div .icon-card>
					<div .icon-card-body>
						<div[font-size: calc(10px + 5vw) ta: center]>
							<i .zmdi .zmdi-toys>
					<div[ta: center]>
						<div[font-size: calc(5px + 1.4vw)]> "INCUBAÇÃO"
			<.col-4 @click.changePage('/transferencia') [p: 1px background-color@hover: rgba(0,0,0,0.4)]>
				<div .icon-card>
					<div .icon-card-body>
						<div[font-size: calc(10px + 5vw) ta: center]>
							<i .zmdi .zmdi-square-right>
					<div[ta: center]>
						<div[font-size: calc(5px + 1.4vw)]> "TRANSFERÊNCIA"
			<.col-4 @click.changePage('/nascimento') [p: 1px background-color@hover: rgba(0,0,0,0.4)]>
				<div .icon-card>
					<div .icon-card-body>
						<div[font-size: calc(10px + 5vw) ta: center]>
							<i .zmdi .zmdi-twitter-box>
					<div[ta: center]>
						<div[font-size: calc(5px + 1.4vw)]> "NASCIMENTO"
			<.col-4 @click.changePage('/processamento') [p: 1px background-color@hover: rgba(0,0,0,0.4)]>
				<div .icon-card>
					<div .icon-card-body>
						<div[font-size: calc(10px + 5vw) ta: center]>
							<i .zmdi .zmdi-assignment-return>
					<div[ta: center]>
						<div[font-size: calc(5px + 1.4vw)]> "PROCESSAMENTO"
			<.col-4 @click.changePage('/integracao') [p: 1px background-color@hover: rgba(0,0,0,0.4)]>
				<div .icon-card>
					<div .icon-card-body>
						<div[font-size: calc(10px + 5vw) ta: center]>
							<i .zmdi .zmdi-stackoverflow>
					<div[ta: center]>
						<div[font-size: calc(5px + 1.4vw)]> "INTEGRAÇÃO"
			<.col-4 @click.changePage('/atividade') [p: 1px background-color@hover: rgba(0,0,0,0.4)]>
				<div .icon-card>
					<div .icon-card-body>
						<div[font-size: calc(10px + 5vw) ta: center]>
							<i .zmdi .zmdi-stackoverflow>
					<div[ta: center]>
						<div[font-size: calc(5px + 1.4vw)]> "ATIVIDADE"

	css .icon-card-body
		pointer-events: none

	css .icon-card
		min-height: 22vw @md: 10vw
		cursor: pointer
		background-color@hover: rgba(0,0,0,0.2)
		padding: 5vw 1vw @md: 2vw 1vw
		position: relative
		display: -webkit-box
		display: -ms-flexbox
		display: flex
		-webkit-box-orient: vertical
		-webkit-box-direction: normal
		flex-direction: column
		min-width: 0
		word-wrap: break-word
		background-color: rgba(0, 0, 0, .2)
		background-clip: border-box
		border: 1px solid transparent
		border-radius: 2px