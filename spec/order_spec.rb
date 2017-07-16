require 'order'

describe Order do
  subject(:order) { Order.new }
  before { @current_orders = { :rice=>[7, 7.0] } }
  before { @current_value }

  describe "#dish_available" do
    it 'chooses available dishes' do
      order.choose_dish
      expect(order.dish_available?).to eq true
    end
  end

  describe "#save_order" do
    it 'saves an order' do
      order.choose_dish
      order.save_order
      expect(order.taken_order?).to eq true
    end
  end

  describe "#calculator" do
    it 'calcualtes the current value of all orders' do
        @current_value = order.calculate(@current_orders)
      expect(@current_value).to eq 49
    end
  end

end
