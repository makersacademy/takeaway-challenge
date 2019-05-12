require 'takeaway'
require 'menu'

describe Takeaway do
  describe '#view_menu' do
    let(:menu) { double :menu }
    subject(:takeaway) { described_class.new(menu) }

    it 'delegates to prices method' do
      allow(menu).to receive(:prices).and_return("spaghetti bolognese: £4.55
        ham and cheese pancake: £3.75
        double-cheeseburger: £4.25
        curly fries: £1.75")
      expect(takeaway.view_menu).to eq("spaghetti bolognese: £4.55
        ham and cheese pancake: £3.75
        double-cheeseburger: £4.25
        curly fries: £1.75")
    end
  end

  describe '#select_order' do
    let(:order) { double :order }
    subject(:takeaway) { described_class.new(order) }

    it 'delegates to add_to_order method' do
      takeaway.select_order("curly fries", 4)
      expect(takeaway.basket).to eq("You added 4x curly fries(s) to the basket")
    end
  end
end
