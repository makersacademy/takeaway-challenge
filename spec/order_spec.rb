require 'order'

describe Order do
  let(:food) {double(:food)}
  it "takes with an order request" do
    order = Order.new(food)
    expect(order.order(food)).to equal (food)
  end
  it "Stores an array of food order" do
    order = Order.new(food, food)
    expect(order.food_ordered).to eq ([food, food])
  end
  it "Calculates the price of the order" do
    order = Order.new(food, food)
    expect(order.cost(food)).to eq 0
  end
end
