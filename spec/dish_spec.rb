require 'dish'

describe Dish do

  subject(:dish) { described_class.new(name, price) }
  let(:name) { "Pizza" }
  let(:price) { 10 }


  it 'should have a name' do
    expect(dish.name).to eq name
  end

  it 'should have a price' do
    expect(dish.price).to eq price
  end
end
