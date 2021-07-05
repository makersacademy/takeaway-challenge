require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  subject(:order) { described_class.new }

  describe '#show_menu' do
    it 'displays a list of menu items and prices' do
      expect(takeaway.show_menu).not_to be_empty
    end
  end

  describe '#add_to_order' do
    it 'adds chosen item and quatity to order' do
      expect { takeaway.add_to_order("hawaiian", 2) }.to change { takeaway.order.cart.length }.by(1)
    end
  end

  describe '#order_total' do
    it 'displays dish totals for the current order' do
      takeaway.add_to_order('hawaiian', 2)
      takeaway.add_to_order('pepperoni', 3)
      expect(takeaway.order_total).to eq("hawaiian x2 = $11.00, pepperoni x3 = $13.50")
    end
  end
end
