require 'takeaway'

describe Takeaway do

	let(:takeaway){Takeaway.new}

	it "should have a menu" do
		expect(takeaway.menu.length).to eq(3)
	end

	it "should be able to add to the order" do
	end

	it "should be able to calculate the cost of the order" do
	end
	
end