require 'order'

describe Order do
  subject(:order) { described_class.new}
  let(:menu) {double :menu}

  describe 'order' do
    it 'creates menu' do
      expect(order.current_order).to include {}
    end

    it 'selects item' do
      order.select_item(:chips, 2)
      expect(order.current_order).to include :chips
    end

    it 'raises error when item not on menu selected' do
      expect {order.select_item('dogshit')}.to raise_error
    end

    it 'calculates price' do
      order.select_item(:fish, 2)
      order.select_item(:chips, 3)
      expect(order.calculate_price).to eq '12.00'
    end

    it 'gives current order' do
      order.select_item(:fish, 2)
      expect(order.check_order).to include :fish
    end
  end
end
#   it 'completes an order' do
#     expect(order.complete_order).to eq {}
#   end
# end
