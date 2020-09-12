require 'dish'

describe Dish do

  subject(:dish) { Dish.new(name, price) }
  let(:name) { 'dish_name' }
  let(:price) { 7.35 }
  let(:pizza_name) { 'Pepperoni pizza'}
  let(:pizza_price) { 8.90 }

  it 'has a name' do
    expect(dish.name).to eq(name)
  end

  it 'has a price' do
    expect(dish.price).to eq(price)
  end
end
