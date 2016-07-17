require 'order'

describe Order do
  let(:food) {double(:food)}
  it 'initializes with a menu' do
    expect(subject.menu).to eq ({:Chicken_Burger => 4, :Chips => 1.5, :Cheeseburger => 4.5, :Kebab => 3.5})
  end
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
    expect(order.cost([:Chips, :Cheeseburger])).to eq (6)
  end
end
