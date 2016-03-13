require 'dish'

describe Dish do

  subject(:dish) { described_class.new(name,price) }
  let(:name) { :porridge }
  let(:price) { 2.30 }

  it 'should have a name' do
    expect(dish.name).to eq(name)
  end

  it 'should have a price' do
    expect(dish.price).to eq(price)
  end
end
