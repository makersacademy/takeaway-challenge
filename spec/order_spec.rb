require 'order'

describe Order do
  subject(:order) { Order.new }

  describe '#choose_dish' do
    it { is_expected.to respond_to(:choose_dish) }
  end

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
end
