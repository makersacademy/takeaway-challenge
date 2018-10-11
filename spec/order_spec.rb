require 'order'

describe Order do
  describe '#add_dish' do
    it 'adds a dish to basket' do
      order = Order.new
      order.add_dish("chicken soup")
      expect(order.basket).to eq ["chicken soup"]
    end
  end
end
