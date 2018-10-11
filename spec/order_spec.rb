require 'order'

describe Order do
  describe '#add_dish' do
  
    it 'adds a dish to a basket incl price' do
      order = Order.new

      order.add_dish("chicken soup", 5)

      expect(order.basket).to eq [{ "chicken soup" => 5 }]
    end
  end
end
