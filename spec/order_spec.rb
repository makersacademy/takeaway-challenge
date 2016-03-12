require 'order'

describe Order do
  let(:menu) { double :menu, list: {MENU_ITEM => MENU_ITEM_PRICE}, price: MENU_ITEM_PRICE }
  subject(:order) { described_class.new(menu) }
  MENU_ITEM = 'Cheese sandwich'
  MENU_ITEM_PRICE = 3
  ITEM_QUANTITY = rand(1..5)

  describe '#initialize' do
    it 'has an empty basket' do
      expect(order.basket).to be_empty
    end
    it 'has a total of 0' do
      expect(order.total).to be_zero
    end
  end

  describe '#view_menu' do
    it 'displays menu' do
      expect(menu).to receive(:list)
      order.view_menu
    end
  end

  describe '#select_item' do

    before do
      order.select_item(MENU_ITEM, ITEM_QUANTITY)
    end

    it 'should add menu item to basket' do
      expect(order.basket).to include(MENU_ITEM => ITEM_QUANTITY)
    end
    it 'raises error when trying to select item that is not on the menu' do
      message = Order::NOT_ON_MENU_ERROR
      expect{ order.select_item('Falafel')}.to raise_error message
    end
    it 'should add cost of items to order cost' do
      expect(order.total).to eq (MENU_ITEM_PRICE*ITEM_QUANTITY)
    end
  end
end
