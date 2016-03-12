require 'order'

describe Order do
  let(:menu) { double :menu }
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
  end
end
