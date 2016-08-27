require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  describe '.check_menu' do
    it 'raises an error if the item is not on the menu' do
      msg = 'This item is not on the menu'
      expect{menu.check_menu("Pizza")}.to raise_error msg
    end
    it 'returns menu item if the item is on the menu' do
      expect(menu.check_menu("Beef Burger")).to eq "Beef Burger"
    end
  end

end
