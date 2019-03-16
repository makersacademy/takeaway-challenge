require 'item'

describe Item do
  let(:name) {double :name }
  let(:value) { double :value }
  let(:quantity) { double :quantity }
  let(:total) { double :total }
  it 'returns price when called' do
    expect(subject).to respond_to(:price)
  end

  it 'the price to return 0 by default' do
    expect(subject.price).to eq(0)
  end

  it 'can be assigned value' do
    item = Item.new(name, value, quantity)
    expect(item.price).to eq value
  end

  it 'can be assigned quantity' do
    item = Item.new(name, value, quantity)
    expect(item.quantity).to eq quantity
  end

  it 'returns total cost' do
    item = Item.new(name, 5, 10)
    expect(item.total).to eq(50)
  end


end
