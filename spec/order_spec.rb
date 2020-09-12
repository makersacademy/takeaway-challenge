require "order"
require "menu"

describe Order do
subject(:order) { described_class.new(menu) }
let(:menu) { instance_double("Menu") }	

it "Lets you add the order" do 
allow(menu).to receive(:exist?).with("PadThai").and_return true
expect(order.add_order("PadThai", 2)).to eq 2
end 

it "Doesnt let you add the order if the dish doesnt exist" do
allow(menu).to receive(:exist?).with("Burger").and_return false
expect { order.add_order("Burger", 2) }.to raise_error("Sorry, we do not serve this")
end

it "does let you order if the dish is in the menu" do 
	allow(menu).to receive(:exist?).with("Curry").and_return true
	expect(order.add_order("Curry", 3)).to eq 3
end 

it "provides you with a total amount for your order" do 
	allow(menu).to receive(:exist?).with("Ramen").and_return true
	allow(menu).to receive(:price).with("Ramen").and_return 9.99
	order.add_order("Ramen", 3)
	total = 29.97
	expect(order.total).to eq total
end
end   