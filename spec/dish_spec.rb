require 'dish'

describe Dish do
  let(:value) { double :value }

  it 'returns price when called' do
    expect(subject).to respond_to(:price)
  end

  it 'the price to return nil by default' do
    expect(subject.price).to eq(nil)
  end

  it 'can be assigned value' do
    item = Dish.new(value)
    expect(item.price).to eq value
  end
end
