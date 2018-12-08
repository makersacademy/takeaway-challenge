require 'dish'

describe Dish do
  subject(:dish) { described_class.new(name, price) }
  let(:name) { double :name }
  let(:price) { double :price }

  it 'has a name' do
    expect(dish.name).to eq name
  end

  it 'has a price' do
    expect(dish.price).to eq price
  end
end
