require_relative '../lib/order'

describe Order do
  let(:order) { Order.new }

  describe '.add' do
    it 'selected dishes are added to order' do
      expect{order.add(10, 2)}.to change{order.selected_dishes}.to include({quantity: 2, dish: "Small Fries", subtotal: 2.00})
    end
  end
end
