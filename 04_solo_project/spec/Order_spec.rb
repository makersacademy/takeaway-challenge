require 'Order'

# test parent-child classes here

describe Order do
  context 'when initialised' do
    it 'creates an instance of Order' do
      menu = double(:menu)
      my_order = Order.new(menu)
      expect(my_order).to be_an_instance_of(Order)
    end
  end

  describe '#add' do
    it 'adds an item to the order array' do
      menu = double(:menu)
      my_order = Order.new(menu)
      expect(menu).to receive(:includes_item).with('burger').and_return(true)
      expect(menu).to receive(:item_out_of_stock).with('burger').and_return(false)
      expect(menu).to receive(:price_of_item).with('burger').and_return(4.5)
      expect(menu).to receive(:stock_of_item_decreases).with('burger', 1)
      
      my_order.add('burger', 1)
      expect(my_order.order).to eq([['burger', 4.5, 1]])
    end
    it 'fails when adding something that is not on the menu' do
      menu = double(:menu)
      my_order = Order.new(menu)
      expect(menu).to receive(:includes_item).with('random').and_return(false)
      
      expect { my_order.add('random', 1) }.to raise_error('Item not on the menu')
    end
    it 'fails when adding something that is out of stock' do
      menu = double(:menu)
      my_order = Order.new(menu)
      expect(menu).to receive(:includes_item).with('chips').and_return(true)
      expect(menu).to receive(:item_out_of_stock).with('chips').and_return(true)
      
      expect { my_order.add('chips', 1) }.to raise_error('Item not in stock')
    end
  end
end
