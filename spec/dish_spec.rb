require 'dish'

describe Dish do
  let(:dish) { described_class.new(dish_name, price) }
  let(:dish_name) { 'Satay '}
  let(:price) { 4.50 }

  it 'creates a dish with a name' do
    expect(dish.name).to eq dish_name
  end

  it 'creates a dish with a price' do
    expect(dish.price).to eq price
  end
end
