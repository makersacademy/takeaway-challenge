require 'customer'

describe Customer do
	let(:customer) {Customer.new}

	it "has a menu" do
		expect(customer).to have_menu
	end

end