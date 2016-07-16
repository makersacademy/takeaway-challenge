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
    it "should take a menu item" do
      expect(takeaway.add_item(margherita)).to eq [margherita]
    end
    it 'should then pass that item to the basket' do
      takeaway.add_item(margherita)
      takeaway.add_item(romana)
      expect(takeaway.basket).to eq [margherita, romana]
    end
    xit 'should raise an error if item is not on the menu' do
      expect(takeaway.add_item(hawaiian)).to raise_error 'Sorry that item is not on the menu'
    end
  end

end
