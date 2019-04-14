require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }
  let(:menu) { double(:menu, print: printed_menu ) }
  let(:printed_menu) { double("Chicken: £3.50") }
  let(:dishes) { {chicken: 2, fish: 1}}
  let(:order) { double(:order, total: 15.50) }


  describe '#print_menu' do
    it 'prints the menu dishes and prices' do
      expect(takeaway.print_menu).to eq(printed_menu)
    end
  end

  describe '#place_order' do
    it 'can order a number of dishes available' do
      expect(order).to receive(:add).twice
      takeaway.place_order(dishes)
    end
  end

  describe '#total' do
    it 'adds up the total of the order' do
      allow(order).to receive(:add)
      total = takeaway.place_order(dishes)
      expect(total).to eq(15.50)
    end
  end
end
