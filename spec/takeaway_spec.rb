require 'takeaway'

describe Takeaway do

  subject(:takeaway) {described_class.new(menu)}
  let(:menu) {double :menu, view_menu: {fish: 3.99, chips: 1.99}}

  describe '#view_menu' do
    it 'return the contents of the menu to the console' do
      expect(menu).to receive(:view_menu)
      takeaway.view_menu
    end
  end

  describe '#add_menu_items' do
    it 'allows user to add items to the menu' do
      expect(menu).to receive(:add_items)
      takeaway.add_menu_items({fish: 3.99, chips: 1.99})
    end
  end

  describe '#order' do
    it 'returns string containing item ordered and current total cost' do
      expect(takeaway.order("chips", 4)).to eq ("4x chips added to basket, current total: 7.96")
    end

    it 'adds correct number of items to basket' do
      takeaway.order("chips", 4)
      takeaway.order("fish", 2)
      expect(takeaway.basket).to eq ("4x chips (@1.99 each), 2x fish (@3.99 each), current total: 15.94")
    end

    it 'returns error if dish does not match any item menu' do
      expect{takeaway.order("dogfood")}.to raise_error ("Sorry 'dogfood' is not an item on the menu")
    end
  end
end
