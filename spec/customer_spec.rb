require 'customer'
require 'menu'

describe Customer do
	let(:customer){Customer.new}
	let(:menu){double :menu}

	it 'should have a phone number initializated' do
		expect(customer.phone_number).to eq "+447759190557"
	end

	it 'should select food' do
		expect(customer.select_food(menu)).to eq customer.selection
	end

end