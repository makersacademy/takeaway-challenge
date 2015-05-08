require 'order'
require 'restaurant'
describe Order do
  it 'can accept a list of dishes' do
    restaurant = Restaurant.new
    restaurant.load_dishes("./lib/dishes.txt")
    order = described_class.new(restaurant)
    dishes = {  "Chicken curry" => "1", "Lamb curry" => "1"  }
    expect(order.place_order(dishes, "7.50")).to eq 7.5
  end
  it 'raises an error if totals dont match' do
    restaurant = Restaurant.new
    restaurant.load_dishes("./lib/dishes.txt")
    order = described_class.new(restaurant)
    dishes = {  "Chicken curry" => "1", "Lamb curry" => "1" }
    expect { order.place_order(dishes, "8.50") }.to raise_error "Wrong total"
  end
end
