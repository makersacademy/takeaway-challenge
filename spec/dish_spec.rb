require 'dish'

describe Dish do
  dish = Dish.new
  it 'has a price' do
    expect(dish).to respond_to(:price)
  end
end
