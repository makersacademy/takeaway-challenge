require 'order'

describe Order do

  let(:menu) {{'item' => 1.11}}
  let(:item) {:item}
  subject(:order) {described_class.new(menu)}

  describe '#add' do
    it 'add item from menu' do
      order.add('item')
      expect(order.status).to eq [menu]
    end
  end

  describe '#status' do
    it 'show order status' do
    end
  end

end

# describe Order do
#   let(:menu) { double :menu, price: '£1.00', contains?: true }
#   subject(:order) { described_class.new(menu) }
#
#   it 'order total to be sum of items added' do
#     order.add('Pizza')
#     order.add('Pizza')
#     expect(order.total).to eq '£2.00'
#   end
# end
