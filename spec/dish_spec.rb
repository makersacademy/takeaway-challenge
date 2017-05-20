require 'dish'

describe Dish do
  let(:dish) { described_class.new('Burger', 3) }

  it 'has a name' do
    expect(dish.name).to eq 'Burger'
  end

  it 'has a price' do
    expect(dish.price).to eq 3
  end
end
