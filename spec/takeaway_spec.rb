require 'takeaway'

describe Takeaway do

	let(:takeaway){Takeaway.new}

	it "should have a menu" do
		expect(takeaway.menu.length).to eq(3)
	end

	it "should list the price of an item" do
		expect(takeaway.menu["regular pizza"]).to eq(8)
	end

end