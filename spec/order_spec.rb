require 'order'
describe Order do
  it 'can accept a list of dishes' do
    restaurant = double { :restaurant }
    order = described_class.new(restaurant)
    dishes = {  "Chicken curry" => "1" }
    expect(order.place_order(dishes)).to include("Chicken curry" => "1")
  end
end
