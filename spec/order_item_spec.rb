require 'order_item'
require 'dish'

describe OrderItem do
  dish1 = Dish.new("Salmon", 2)
  order_item = OrderItem.new(dish1, 2)
 
  it "has a dish" do
    expect(order_item.dish).to eq dish1
  end

  it "knows the quanity" do
    expect(order_item.quantity).to eq 2
  end
end