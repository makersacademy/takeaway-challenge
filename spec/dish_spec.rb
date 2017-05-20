
require_relative '../lib/dish.rb'

describe Dish do
  let(:name) { 'Chicken in yellow bean sauce' }
  let(:description) { 'Fried chicken breast pieces in a traditional yellow bean sauce, served with cashew nuts and sweet peppers' }
  let(:price) { 7 }
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