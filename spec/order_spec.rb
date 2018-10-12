require 'order'

describe 'Order' do
  describe 'select dishes' do
    it 'records 1 dish selection' do
      order = Order.new
      order.select_dish("Small chips")
      expect(order.order_items[0]).to eq "Small chips"
    end

    it 'records mutiple dish selection 1 of each' do
      order = Order.new
      order.select_dish("Small chips")
      order.select_dish("Bread roll")
      expect(order.order_items.join(" ")).to eq "Small chips Bread roll"
    end

    it 'records mutiple dish selection multiples of each' do
      order = Order.new
      order.select_dish("Small chips", 2)
      order.select_dish("Bread roll", 3)
      expect(order.order_items.join(" ")).to eq "Small chips Small chips Bread roll Bread roll Bread roll"
    end
  end

  describe 'calculate price' do
    it 'returns the cost of the order' do
      order = Order.new
      order.select_dish("Small chips")
      order.select_dish("Bread roll")
      expect(order.total).to eq 2.55
    end

    it 'returns the cost of the order - multiple items' do
      order = Order.new
      order.select_dish("Small chips", 2)
      order.select_dish("Bread roll", 3)
      expect(order.total).to eq 5.65
    end
  end
end
