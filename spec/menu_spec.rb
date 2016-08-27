require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  describe '.check_menu' do
    it 'raises an error if the item is not on the menu' do
      msg = 'This item is not on the menu'
      expect{menu.check_menu("Pizza")}.to raise_error msg
    end
    it 'returns nil if the item is on the menu' do
      expect(menu.check_menu("Beef Burger")).to eq nil
    end
  end

  describe '.price' do
    it 'returns the price of a menu item' do
      expect(menu.price("Special Burger")).to eq 12.5
    end
  end

end
