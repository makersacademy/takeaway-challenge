require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:item) { :hawaiian }
  let(:quantity) { 4 }

  describe '#initialize' do
    it 'creates an empty order list to begin with' do
      expect(order.cart).to be_empty
    end
  end

  describe '#add_cart' do
    it 'adds menu item to cart' do
      expect { order.add_cart(item, quantity) }.to change { order.cart.length }.by(1)
    end
  end
end
