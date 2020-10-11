require 'order'

describe Order do
  
  subject(:order)         { described_class.new(menu) }
    let(:menu)              { double('menu', dishes: available_dishes) }
    let(:available_dishes)  {
      {
        "chicken curry": 8.00, 
        "vegetable curry": 6.50
      }
    } 

  describe '#add_order' do
  
    context 'item is available' do
      before do
        allow(order).to receive(:available?).and_return(true)
      end
      it 'adds item to cart' do
        current_order = {"chicken curry" => 1}
        order.add_to_cart("chicken curry", 1)
        expect(order.cart).to eq current_order
      end
      it 'lets you know what has been added to the cart' do 
        expect(order.add_to_cart("chicken curry")).to eq "1 x chicken curry added to cart."
      end
    end

    context 'item is not available' do 
      before do
        allow(order).to receive(:available?).and_return(false)
      end
      it 'raises an error if the item is not available' do

        expect { order.add_to_cart("chicken curry", 1) }.to raise_error "Could not add to order: Item not available"
      end
    end

  end 

  describe '#checkout' do
  
  let(:full_cart)         { {"chicken curry" => 2, "vegetable curry" => 1} }

    it 'returns an order confirmation message contain the order and cost of the order' do
      message = "Your order has been placed. Total cost is £22.50"

      expect(order.checkout(full_cart)).to eq message
    end
  end

end
