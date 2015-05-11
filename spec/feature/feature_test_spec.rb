require 'menu'
require 'customer'

feature 'restaurant has a menu' do
	scenario 'the customer can view the menu' do
		menu = Menu.new
		expect(menu.view_menu).to eq ({'meat' => 7, 'fish' => 8})
	end

	scenario 'customer wants to place order' do
		customer = Customer.new
		menu = Menu.new
		customer.place_order('meat')
		expect(customer.place_order('meat')).to eq ({'meat'=>7})

		scenario 'customer wants bill totalled' do
			customer = Customer.new
			menu = Menu.new
			customer.request_bill
			exptect(customer.request_bill).to eq
		 
	end
end
