require './lib/menu'

describe Menu do
  let(:menu) {[{item: 5, name: "rice", price: 10}]}
  subject(:test_menu) { described_class.new(menu) }

  describe "#print_menu" do
    it 'takes a menu as a array of hashes and returns it as a formatted string' do
      expect(test_menu.print_menu(menu)).to include("5. rice - 10")
    end
  end

  describe '#item_available?' do
    it 'returns true if item is available on the menu' do
      expect(test_menu.item_available?(5)).to eq(true)
    end

    it 'returns false if item is not on the menu' do
      expect(test_menu.item_available?(10)).to eq(false)
    end
  end

  describe '#get_item_price' do
    it 'returns the price of an item' do
      expect(test_menu.get_item_price(5)).to eq(10)
    end
  end


end