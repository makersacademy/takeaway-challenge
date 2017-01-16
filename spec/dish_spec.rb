require 'dish'

describe Dish do
  subject(:dish) { described_class.new('Name', 1) }

  it 'has a name' do
    expect(dish.name).to eq('Name')
  end

  it 'has a price' do
    expect(dish.price).to eq(1)
  end
end
