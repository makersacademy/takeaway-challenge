require 'cart'

describe Cart do
  subject(:cart) { described_class.new }

  describe '#order' do
    it 'stores order quantity' do
      cart.order("pizza", 2)
      expect(cart.basket).to include({ "pizza" => 2 })
    end
    it 'raises an error when the dish is not available' do
      expect { cart.order("in the court", 2) }.to raise_error 'Item unavailable'
    end
  end

  describe '#total_price' do
    it 'computes the total price of the order' do
      cart.order("pizza", 2)
      cart.order("coke", 2)
      expect(cart.total_price).to eq 8
    end
  end

  describe '#checkout' do
    it 'raises an error when the confirmed price is incorrect' do
      cart.order("pizza", 2)
      expect { cart.checkout(1) }.to raise_error 'Incorrect total price'
    end
    context 'Order has been confirmed' do
      it 'sends a text message' do
        cart.order("pizza")
        expect(cart).to receive(:send_text)
        cart.checkout(3)
      end
    end
  end
end
