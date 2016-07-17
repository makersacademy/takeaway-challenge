require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, print: print_menu) }
  let(:print_menu) { "Margherita: £6.50" }
  let(:margherita) { double :margherita }
  let(:romana) { double :romana }


  describe '#print_menu' do
    it 'should print the menu with prices' do
      expect(takeaway.print_menu).to eq (print_menu)
    end
  end

  describe '#add_item' do
    it 'should add a selected item to the basket' do
      
    end
  end

end
