require 'customer'

describe Menu do
	it 'provides the customer with a menu of options' do
		customer = Customer.new
		menu = Menu.new 
		customer.place_order 'meat'
		expect(customer.place_order('meat')).to eq ({'meat' => 7})
	end
end
