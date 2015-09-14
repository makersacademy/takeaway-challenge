require 'rspec'
require_relative '../lib/takeaway_class.rb'

describe Takeaway do
	it 'can be asked for a menu' do
		expect(subject).to respond_to(:menu)
	end

	it 'can place orders when passed a dish, quantity of meals, and total cost' do
		expect(subject).to respond_to(:takeorder).with(2).arguments
	end

	it 'remembers orders' do
		subject.takeorder({"Cheeseburger" => 1}, 1)
		expect(subject.order).to eq ({"Cheeseburger" => 1})
	end

	it 'calculates the total cost of each order' do
		subject.takeorder({"Cheeseburger" => 1}, 1)
		expect(subject.actualcost).to eq 1
	end

	it 'raises an error when a dish is ordered that is not on the menu' do
		expect{subject.takeorder({"Whatevs" => 1}, 1)}.to raise_error "I'm sorry, your order is not on the menu"
	end

	it 'raises an error when the customer suggests the wrong price of the order' do
		expect{subject.takeorder({"Cheeseburger" => 1}, 2)}.to raise_error 'You have added the wrong price'
	end

end

# subject.giveorder({"Hamburger" => 3}, 3)
# 		expect(subject.order).to eq ({"Hamburger" => 3}, 3)