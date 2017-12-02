require 'dish'

describe Dish do
  dish = Dish.new(name = 'Fried Rice', price = '6')

  it 'has a name' do
    expect(dish.name).to eq 'Fried Rice'
  end

  it 'has a price' do
    expect(dish.price).to eq '6'
  end
end
