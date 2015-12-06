require 'item'

describe Item do
  let(:item) { described_class.new(item_name, price) }
  let(:item_name) { 'Satay '}
  let(:price) { 4.50 }

  it 'creates an item with a name' do
    expect(item.name).to eq item_name
  end

  it 'creates an item with a price' do
    expect(item.price).to eq price
  end
end
