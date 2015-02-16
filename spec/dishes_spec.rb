require 'dishes'

describe Dish do

  it 'has a name and a price' do
    dish = Dish.new("pizza", 5)
    expect(dish.name && dish.price).to eq "Pizza" && 5
  end
end