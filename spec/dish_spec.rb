require 'dish'

describe Dish do

  let(:dish) { Dish.new('Margherita', 10) }

  it 'can tell met its name' do
    expect(dish.name).to eq('Margherita')
  end

  it 'can tell met its price' do
    expect(dish.price).to eq(10)
  end
  
end
