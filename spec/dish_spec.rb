require 'dish'

describe Dish do
  dish = Dish.new
  it 'has a price' do
    expect(dish).to respond_to(:price)
  end
  it 'can have different types of dish' do
    other_dish = Dish.new
    expect(other_dish).not_to be(dish)
  end
end
