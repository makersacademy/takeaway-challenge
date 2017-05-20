require 'dish'

describe Dish do
  subject(:dish) { described_class.new(:name, :price) }

  it 'allows dish to have a name' do
    expect(dish.name).to eq :name
  end

  it 'allows dish to have a price' do
    expect(dish.price).to eq :price
  end

end
