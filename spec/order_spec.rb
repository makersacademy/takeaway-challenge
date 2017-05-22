require 'order'

describe Order do
  let(:item1) { double('item1', price:3)}
  let(:item2) { double('item2', price:2)}
  let(:cart) { double('cart', list:[item1, item2])}
  let(:order) {described_class.new(cart,'Restaurant')}

  describe '#calculate_total' do
    it 'gives sum of prices of items in Order' do
      expect(order.calculate_total).to eq(item1.price + item2.price)
    end
  end

  
end
