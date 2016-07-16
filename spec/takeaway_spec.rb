require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, print: print_menu) }
  let(:print_menu) { "Margherita: £6.50" }


  describe '#print_menu' do
    it 'should print the menu with prices' do
      expect(takeaway.print_menu).to eq (print_menu)
    end
  end

  describe '#place_order' do
    it 'should order a selection of available dishes'
  end

end
