require 'order_summary'

describe OrderSummary do

  subject(:order_summary) { described_class.new }
  # let(:order) { double('order') }

  context 'order summary' do

    it 'contains a log of the order' do
      # allow(order).to receive(:add_item).with("Golden French Fries") { {"Golden French Fries" => 1} }
      # order.add_item("Golden French Fries")
      expect(order_summary.basket).to eq({})
    end
  end

  # context 'it verifies the final order' do
  #   before do
  #     allow(order).to receive(:total_price) {3}
  #   end
  #
  #     it 'raise an error if an order is invalid' do
  #       expect {order_summary.confirm_order(2)}.to raise_error "Sorry our records don't match, we believe the total price is £3.  Please check your order."
  #     end

      # it 'checks the customers price with the #total_price' do
      #   # order.add_item("Pure Beef Hamburger")
      #   expect(order_summary.price_correct?(1)).to eq true
      # end
  # end
end
