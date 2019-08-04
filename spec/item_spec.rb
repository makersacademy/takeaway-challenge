require 'item'

describe Item do
  let(:item) { described_class.new("bread", 2) }

  describe '#add_to_order' do
    it 'increases quantity by given amount' do
      item.add_to_order(2)
      item.add_to_order(1)
      expect(item.quantity).to eq 3
    end
  end

  it 'responds to name' do
    expect(item).to respond_to(:name)
  end

  it 'responds to price' do
    expect(item).to respond_to(:price)
  end
end
