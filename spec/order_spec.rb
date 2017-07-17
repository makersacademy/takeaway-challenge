require 'order'
require 'time'
describe Order do
  order = Order.new({ tuna: 4, frog: 1 })
 subject(:order) { described_class.new }

  describe '#add item to order' do
    it 'saves each item ordered to a hash' do
      expect(order.add_item_to_order("tuna", 3)).to eq({ tuna: [4, 3] })
    end
  end

  describe '#order check' do
    it 'returns a total of the items ordered' do
      order.add_item_to_order("tuna", 3)
      order.add_item_to_order("frog", 1)
      expect(order.check_order).to eq nil
    end
  end


  describe '#order' do
    it 'returns the instance variable @order' do
      expect(order.order).to eq({ tuna: [4, 3], frog: [1, 1] })
    end
  end

  describe '#place_order' do
    it 'places the order when the correct total is given' do
      clock = Clock.new
      clock = clock.times
      message = "Thank you! Your order was placed and will be delivered before #{clock}"
      expect(order.place_order(13)).to eq message
    end

    it 'raises an error if you try to under pay' do
      message = "Sorry we don't hangel"
      expect { order.place_order(12) }.to raise_error message
    end

    it 'raises an error if you try to over pay' do
      message = "To much try again"
      expect { order.place_order(14) }.to raise_error
    end
  end
end
