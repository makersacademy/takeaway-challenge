require 'order_item'

describe OrderItem do

  let(:name) {"Chow mein"}
  let(:quantity) {1}
  subject(:item) {described_class.new(name: name, quantity: quantity)}

  describe '#name' do
    it 'should return a name' do
      expect(item.name).to eq name
    end
  end

  describe '#quantity' do
    it 'should return a quantity' do
      expect(item.quantity).to eq quantity
    end
  end

  describe '#price' do
    it 'should return a price of zero when not initialized with a price' do
      expect(item.price).to eq 0
    end
  end

end
