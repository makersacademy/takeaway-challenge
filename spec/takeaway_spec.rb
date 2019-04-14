require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }

  describe '#print_menu' do
    let(:menu) { double(:menu, print: printed_menu ) }
    let(:printed_menu) { double("Chicken: £3.50") }

    it 'prints the menu dishes and prices' do
      expect(takeaway.print_menu).to eq(printed_menu)
    end
  end

end
