require 'dish'

describe Dish do

  it 'is initialized with a price' do
    dish = Dish.new('rice', 3)
    expect(dish.price).to eq 3
  end

  it 'it is initialized with a name' do
    dish = Dish.new('rice', 3)
    expect(dish.name).to eq "rice"
  end

end
