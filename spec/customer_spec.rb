require 'customer'

describe Customer do

	let(:customer){Customer.new([awesome_menu])}

	it 'should have a menu' do
		expect(customer.menu_list).to eq([awesome_menu])
	end

end