require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  MENU_ITEM = 'Cheese sandwich'
  MENU_ITEM_PRICE = 3

  describe '#add_to_menu' do
    it 'should add item to menu hash' do
      menu.add_to_menu(MENU_ITEM,MENU_ITEM_PRICE)
      expect(menu.list).to include MENU_ITEM => MENU_ITEM_PRICE
    end
  end

  describe '#price' do
    it 'should return price of item' do
      menu.add_to_menu(MENU_ITEM,MENU_ITEM_PRICE)
      expect(menu.price(MENU_ITEM)).to eq MENU_ITEM_PRICE
    end
  end
end
