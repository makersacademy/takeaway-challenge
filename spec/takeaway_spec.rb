require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }
  let(:menu) { double(:menu, print: printed_menu ) }
  let(:printed_menu) { double("Chicken: £3.50") }
  let(:dishes) { {chicken: 2, fish: 1}}
  let(:order) { double(:order) }


  describe '#print_menu' do
    it 'prints the menu dishes and prices' do
      expect(takeaway.print_menu).to eq(printed_menu)
    end
  end

  describe '#place_order' do
    it 'can order a number of dishes available' do
      expect(takeaway.place_order(dishes)).to eq ('Your order comes to £15.50')
    end
  end

end
