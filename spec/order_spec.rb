require 'order'

describe Order do
  subject(:order) { described_class.new}
  let(:menu) {double :menu}

  describe 'order'
    it 'creates current order array' do
      expect(order.current_order).to eq []
    end

    it 'selects item' do
      order.select_item(menu,'chips',2)
      expect(order.current_order).to include 'chips'
    end

    it 'raises error when item not on menu selected' do
      expect {order.select_item('dogshit')}.to raise_error
    end

    it 'calculates price' do
      order.select_item(menu,'fish',1)
      order.select_item(menu,'chips',1)
      expect(order.calculate_price).to eq 5
    end
  end
#   it 'completes an order' do
#     expect(order.complete_order).to eq []
#   end
# end
