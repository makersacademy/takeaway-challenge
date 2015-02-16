require 'customer'

describe Customer do 


	it 'should be able to provide a telephone number' do
		customer = Customer.new
		expect(customer.telephone_number("07738567183")).to eq "+447738567183"
	end

	it 'should be able to provide a telephone number in a different format' do
		customer = Customer.new
		expect(customer.telephone_number("+447738567183")).to eq "+447738567183"
	end
	
	it 'should be able to provide a telephone number in a different format' do
		customer = Customer.new
		expect(customer.telephone_number("447738567183")).to eq "+447738567183"
	end
end