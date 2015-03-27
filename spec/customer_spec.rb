require 'customer'

describe Customer do

	let(:customer){Customer.new(1234)}

	it 'has a number' do
		expect(customer.number).to eq 1234
	end

end