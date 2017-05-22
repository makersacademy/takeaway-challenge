require 'dish'

describe Dish do
  let(:name) { 'name' }
  let(:price) { 10 }
  subject(:dish) { described_class.new(name, price) }

  it 'has a name' do
    expect(dish.name).to eq name
  end

  it 'has a price' do
    expect(dish.price).to eq price
  end
end
