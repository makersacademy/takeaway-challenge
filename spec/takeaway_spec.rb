require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}

  let (:menu) { double(:menu, show: dishes, dishes: dishes)}
  let (:dishes) { { Burger: 3, Chips: 2, Drink: 1 } }
  let (:order) { double(:order) }

  describe '#show_menu' do
    it 'should show a list of available menu items' do
      expect(takeaway.show_menu).to eq ["Burger: £3", "Chips: £2", "Drink: £1"]
    end
  end

  describe '#place_order' do
    before do
      allow(takeaway).to receive(:available?).and_return true
      allow(order).to receive(:add).with(:burger, 2).and_return(burger: 2)
      allow(order).to receive(:overview).and_return(burger: 2)
    end
    it 'should return an error when item not avaialble' do
      allow(takeaway).to receive(:available?).and_return false
      expect(takeaway.place_order('MacNCheese', 5)).to eq 'This item is not available'
    end
    it 'should store the name and quantity of dish' do
      takeaway.place_order(:Burger, 2)
      expect(takeaway.show_order).to include("Burger x2: £0")
    end
  end
end
