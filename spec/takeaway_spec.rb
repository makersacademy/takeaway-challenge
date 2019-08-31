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
end
