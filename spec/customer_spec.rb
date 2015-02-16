require 'customer'

describe Customer do

	let(:customer){Customer.new}

	it "should have an empty cart upon initialising" do
		expect(customer.order).to eq []
	end

	it "can add an item" do
		customer.add_item("regular pizza")
		expect(customer.order).to eq ["regular pizza"]
	end

	it "can add multiple items" do
		customer.add_item("daily special pizza", 5)
		expect(customer.order).to eq ["daily special pizza", "daily special pizza", "daily special pizza", "daily special pizza", "daily special pizza"]
	end
end