require 'dish'

describe Dish do
  let(:name) { "Stew" }
  let(:price) { 3.99 }
  let(:dish) { Dish.new(name, price) }

  it 'set the name when you create it' do
    expect(dish.name).to eq(name)
  end

  it 'set the price when you create it' do
    expect(dish.price).to eq(price)
  end
end
