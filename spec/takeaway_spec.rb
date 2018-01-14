require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }
  let(:menu) { double(:menu, display: 'pizza: 8.99, sandwich: 3.75') }
  let(:order) { double(:order) }

  describe '#display_menu' do
    it 'displays a menu with meals and their prices' do
      expect(takeaway.display_menu).to eq('pizza: 8.99, sandwich: 3.75')
    end
  end

  describe '#make_order' do
    it 'makes an order for a number of meals' do
      meals ={'burrito' => 3, 'pie' => 2}
      allow(order).to receive(:add)
      takeaway.make_order(meals)
    end
  end

end
