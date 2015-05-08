require 'customer'

describe Customer do
	let(:customer) {Customer.new(["menu_1"])}

	it "has a menu" do
		expect(customer.dish_list).to eq(["menu_1"])
	end
end