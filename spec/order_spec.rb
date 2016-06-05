require 'order'

describe Order do

  let(:menu) {{'item1'=>1.11, 'item2'=>2.22}}
  subject(:order) {described_class.new(menu)}

  describe '#add' do
    it 'returns confirmation message' do
      expect(order.add('item1', 3)).to eq "3x item1(s) added to our order!"
    end
  end

  describe '#trolley' do
    it 'shows trolley' do
      order.add('item1', 3); order.add('item2', 3)
      expect(order.trolley).to eq "3x item1(s) = £3.33, 3x item2(s) = £6.66"
    end
  end

  describe '#total' do
    it 'sum amount of items added' do
      order.add('item1', 3); order.add('item2', 3)
      expect(order.total).to eq '£9.99'
    end
  end

  describe '#checkout' do
    it 'checkout and reset order status' do
      order.add('item1', 3); order.add('item2', 3)
      order.checkout(9.99)
      expect(order.status).to eq []
    end

    it 'fails if amount not equal total' do
      expect{order.checkout(9.99)}.to raise_error "wrong amount"
    end
  end
end
