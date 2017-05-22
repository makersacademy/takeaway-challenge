
require_relative '../lib/dish'

describe Dish do
  let(:name) { 'Big Salad' }
  let(:description) { 'Big lettuce, big carrots, tomatoes like volleyballs!' }
  let(:price) { 6 }
  subject(:dish) { Dish.new(name, description, price) }

  it 'has a name' do
    expect(dish.name).to eq name
  end

  it 'has a description' do
    expect(dish.description).to eq description
  end

  it 'has a price' do
    expect(dish.price).to eq price
  end
end
