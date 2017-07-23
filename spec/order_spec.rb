require 'order'

describe Order do
  subject(:order) { Order.new }
  let(:current_orders) { { :rice => [7, 7.0] } }
  let(:current_value) { @current_value }

  describe "#save_order" do
    it 'saves an order' do
      order.save_order
      expect(order.taken_order?).to eq true
    end
  end

  describe "#calculator" do
    it 'calcualtes the current value of all orders' do
      current_value = order.calculate(current_orders)
      expect(current_value).to eq 49.0
    end
  end

end
