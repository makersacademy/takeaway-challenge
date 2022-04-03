require_relative '../lib/dish'

describe Dish do
  let (:dish) { Dish.new(:name, :price) }

  it 'has a name' do
    expect(dish.name).to eq :name
  end

  it 'has a price' do
    expect(dish.price).to eq :price
  end
end
