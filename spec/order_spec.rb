require 'order'

describe Order do
  let(:menu) { double :menu, menu: {'Beef burger' => 8.5} }
  subject(:order) { described_class.new(menu) }

  describe '#initialize' do
    it 'has an empty basket' do
      expect(order.basket).to be_empty
    end
    it 'has a price of 0' do
      expect(order.price).to be_zero
    end
  end

  describe '#select_item' do
    it 'should add menu item to basket' do
      quantity = rand(4)
      order.select_item('Beef burger', quantity)
      expect(order.basket).to include('Beef burger' => quantity)
    end
    it 'raises error when trying to select item that is not on the menu' do
      message = Order::NOT_ON_MENU_ERROR
      expect{ order.select_item('Falafel')}.to raise_error message
    end
  end
end
