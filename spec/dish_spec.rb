require 'dish'

describe Dish do
  it "can make a new dish of name 'egg fried rice' with price of 4.50" do
    new_dish = Dish.new('egg fried rice', 4.50)
    expect(new_dish.name).to eq('egg fried rice')
    expect(new_dish.price).to eq(4.50)
  end

end
