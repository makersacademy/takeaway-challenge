require 'takeaway'

describe Takeaway do

	let(:takeaway) { Takeaway.new }

	it "Menu with names of the dishes and prices" do
		expect(subject.respond_to?(:list)).to be true
	end

	it "Can select the dish" do
		subject.order(1)
		expect(subject.list_ord).to eq ({:Pizza => 1})
	end

	it "List of ordered dishes" do
		subject.order(1)
		subject.order(7)
		subject.order(5)
		subject.order(2)
		expect(subject.list_ord.size).to eq(4)
	end

	it "The total price of the order" do
		subject.order(1)
		subject.order(2)
		subject.order(5)
		expect(subject.t_price).to eq(28)
	end
end