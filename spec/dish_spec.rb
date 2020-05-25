require 'dish'

describe Dish do
  dish = Dish.new('burger', 10)
  it 'should have a name' do
    expect(dish.name).to eq('burger')
  end

  it 'should have a price' do
    expect(dish.price).to eq(10)
  end
end
