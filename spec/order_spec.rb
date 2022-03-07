require "order"

describe Order do

  let(:cheeseburger) { double(:Dish_object) }
  let(:fries) { double(:Dish_object) }
  let(:coke) { double(:Dish_object) }

  let(:chosen_dishes) { [cheeseburger, fries, coke] }

  it "should take an order of Dish objects as an argument and save it to current_order" do
    new_order = Order.new(chosen_dishes)
    expect(new_order.current_order).to eq([cheeseburger, fries, coke])
  end

end
