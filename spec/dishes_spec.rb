require 'dishes'

describe Dish do
  let(:dish) {Dish.new('Chicken Stew', 4.50)}

  it 'should have a name' do
    expect(dish.name).to eq('Chicken Stew')
  end

  it 'should have a price' do
    expect(dish.price).to eq(4.50)
  end

  
end
