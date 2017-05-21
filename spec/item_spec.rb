require 'item'

describe Item do
  let(:item) { described_class.new('Burger', 3) }

  it 'has a name' do
    expect(item.name).to eq 'Burger'
  end

  it 'has a price' do
    expect(item.price).to eq 3
  end
end
