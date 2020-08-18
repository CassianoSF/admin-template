describe "Login" do
	it 'should login with right credentials' do
		cy.visit('http://localhost:8080/login')
		cy.get('input[type=email]').type('cassiano@mail.com')
		cy.get('input[type=password]').type('123123')
		cy.get('.btn').click()