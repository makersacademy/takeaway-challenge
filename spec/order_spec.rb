require 'order'

describe Order do

subject(:order) { Order.new }
let(:quantity) { double :quantity }
let(:dish) { double :dish }

  it "should create an order" do
    order.add(dish, quantity)
    expect(order.basket).to include Hash({:quantity => quantity, :dish => dish})
  end

  it "should print the order when order is placed" do
    expect(order.add(dish, quantity)).to eq ("#{quantity}x #{dish}(s) added to your basket")
  end


end
