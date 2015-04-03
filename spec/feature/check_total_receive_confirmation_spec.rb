feature 'check total and receive confirmatio or error' do
  let(:restaurant) { Restaurant.new }
  let(:order) { Order.new(restaurant) }
  before(:each) do
    restaurant.load_dishes("./lib/dishes.txt")
  end
  scenario 'raise error if check given total doesnt match actual total' do
    restaurant.load_dishes("./lib/dishes.txt")
    dishes = {  "Chicken curry" => "1", "Lamb curry" => "1" }
    expect { order.place_order(dishes, "8.50") }.to raise_error 'Wrong total'
  end
  scenario 'sends confirmation'
end
