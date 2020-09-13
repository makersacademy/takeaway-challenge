require "restaurant"

describe Restaurant do 
subject(:bao) { Restaurant.new(menu, order) }
let(:menu) { double :menu, print: shown_menu }
let(:order) { instance_double("Order", total: 41.95) }
let(:shown_menu) { "Menu" }
let(:dishes) { {"Ramen" => 3, "Curry" => 2 }}
it "shows the menu" do 
	expect(bao.show_menu).to eq(shown_menu)
end

it "allows allows to order several dishes" do 
	allow(order).to receive(:add_order).twice
	bao.confirm_order(dishes)
end 

it "shows the order total price of the order" do
	allow(order).to receive(:add_order)
	total = bao.confirm_order(dishes)
	expect(total).to eq(41.95)
end
end 
