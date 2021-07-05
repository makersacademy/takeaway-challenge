require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:menu) { double(:menu, dishes: { 'hawaiian' => 5.5, 'pepperoni' => 4.5 }) }

  describe '#initialize' do
    it 'creates an empty order list to begin with' do
      expect(order.cart).to be_empty
    end
  end

  describe '#add_cart' do
    it 'adds menu item to cart' do
      expect { order.add_cart('hawaiian', 1) }.to change { order.cart.length }.by(1)
    end
  end

  describe '#cart_total' do
    it 'creates a total of all items and prices in cart' do
      order.add_cart('hawaiian', 2) # $5.50
      order.add_cart('pepperoni', 3) # $4.50
      expect(order.cart_total(menu)).to eq("hawaiian x2 = $11.00, pepperoni x3 = $13.50")
    end
  end
end
