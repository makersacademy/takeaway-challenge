require 'cart'

describe Cart do
  subject(:cart) { described_class.new }

  describe '#order' do
    it 'stores order quantity' do
      cart.order("pizza", 2)
      expect(cart.basket).to include ({"pizza" => 2})
    end

    it 'raises an error when the dish is not available' do
      expect { cart.order("in the court", 2) }.to raise_error 'Item unavailable'
    end
  end

  it 'computes the total price of the order' do
    cart.order("pizza", 2)
    cart.order("coke", 2)
    expect(cart.total_price).to eq (8)
  end
end
