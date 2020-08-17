extern describe, it, cy, beforeEach, afterEach

describe "Login" do
		it 'should log with right credentials' do
			cy.visit('http://localhost:8080/login')