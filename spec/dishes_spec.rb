require 'dish'

describe Dish do
  it 'should have a name' do
    dish = Dish.new("Chicken Marsala", 24)
    expect(dish.name).to eq "Chicken Marsala"
  end

  it 'should have a price' do
    dish = Dish.new("Chicken Marsala", 24)
    expect(dish.price).to eq 24
  end
end
