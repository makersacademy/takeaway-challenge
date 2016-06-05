require 'order'

describe Order do

  let(:menu) {{'item1'=>1.11, 'item2'=>2.22}}
  let(:item) {:item}
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

end

#   it 'order total to be sum of items added' do
#     order.add('Pizza')
#     order.add('Pizza')
#     expect(order.total).to eq '£2.00'
#   end
