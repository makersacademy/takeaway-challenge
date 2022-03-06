require 'dish'

describe Dish do
  it 'creates a dish with a name and price' do
    pizza = Dish.new('Pizza', 8)
    expect(pizza.name).to eq('Pizza')
    expect(pizza.price).to eq(8)
  end
end