require 'dish'

describe Dish do

  it 'is initialized with a price' do
    dish = Dish.new(3, "rice")
    expect(dish.price).to eq 3
  end

  it 'it is initialized with a name' do
    dish = Dish.new(3, "rice")
    expect(dish.name).to eq "rice"
  end

end
