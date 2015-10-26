require 'order'

describe Order do

  subject(:order) { described_class.new(menu_klass = menu, order_summary_klass\
  = OrderSummary.new, sms_klass = sms)}
  let(:sms) { double('sms')}
  let(:menu) { double('menu', :dishes => { "Golden French Fries" => 0.5 }) }

  context 'selecting an item from the menu' do

    it 'allows a customer to select an item' do
      expect(order.add_item("Golden French Fries")).to eq\
      "1 Golden French Fries(s) added to your order"
    end

    it 'returns an error message if selected item is not on the menu' do
      expect { order.add_item("Chips") }.to raise_error\
      "Sorry we don't have Chips on the menu"
    end
  end

  context 'it calculates the cost of the order' do

    it 'calculates the total price' do
      5.times{order.add_item("Golden French Fries")}
      expect(order.total_price).to eq 2.5
    end
  end

  context 'it verifies the final order' do
    before do
      allow(order).to receive(:total_price) {3}
    end

      it 'raise an error if an order is invalid' do
        expect {order.confirm_order(2)}.to raise_error\
        "Sorry our records don't match, we believe the total price is £3.  Please check your order."
      end

      it 'sends a text if the order is valid' do
        expect(sms).to receive(:send_sms)
        order.confirm_order(3)
      end
  end
end
