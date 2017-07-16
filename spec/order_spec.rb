require 'order'

describe Order do
  order = Order.new({ tuna: 4, frog: 1 })

  describe '#add item to order' do
    it 'saves each item ordered to a hash' do
      expect(order.add_item_to_order("tuna", 3)).to eq({ tuna: [4, 3] })
    end
  end

  describe '#order check' do
    it 'returns a total of the items ordered' do
      order.add_item_to_order("tuna", 3)
      order.add_item_to_order("frog", 1)
      expect(order.check_order).to eq "--- Total = €13 ---"
    end
  end

  describe '#order' do
    it 'returns the instance variable @order' do
      expect(order.order).to eq({ tuna: [4, 3], frog: [1, 1] })
    end
  end

  describe '#place_order' do
    it 'places the order when the corect total is given' do
      expect(order.place_order(13)).to eq("Thank you! Your order was placed and will be delivered before 18:52")
    end

    it 'raises an error if you try to under pay' do
      expect { order.place_order(12) }.to raise_error("Sorry we don't hangel")
  end

    it 'raises an error if you try to over pay' do
      expect { order.place_order(14) }.to raise_error "To much try again"
    end
  end
end
