require "order"
require "menu"

describe Order do
subject(:order) { described_class.new(menu) }
let(:menu) { instance_double("Menu") }	
let(:dishes) do { "PadThai" => 1, "Curry" => 2 }
end 

it "Lets you add the order" do 
allow(menu).to receive(:exist?).with("PadThai").and_return true
expect(subject.add_order("PadThai", 2)).to eq 2
end 

it "Doesnt let you add the order if the dish doesnt exist" do
allow(menu).to receive(:exist?).with("Burger").and_return false
expect { order.add_order("Burger", 2) }.to raise_error("Sorry, we do not serve this")
end
end  