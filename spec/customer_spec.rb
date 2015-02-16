require 'customer'

describe Customer do 

	it 'should be able to proved a telephone number' do
		customer = Customer.new
		expect(customer.telephone_number("07738567183")).to eq "+447738567183"
	end


	end