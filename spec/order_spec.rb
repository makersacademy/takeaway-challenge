require 'order'
require 'menu'

describe Order do
  let(:order) { described_class.new }
  let(:menu) { double :menu }

  describe '#initialize' do
    it 'with an empty order' do
      expect(order.order).to be_empty
    end
    it 'with zero as the total' do
      expect(order.total).to eq 0
    end
  end

  describe '#add' do
    it 'prevents item from being added to order if not on menu' do
      item = "Chicken Burger"
      allow(menu).to receive(:item?).with(item).and_return(false)
      expect { order.add(item) }.to raise_error(RuntimeError)
    end
    it 'adds an item to the order' do
      item = "Cheese Burger"
      allow(menu).to receive(:item?).with(item).and_return(true)
      order.add(item)
      expect(order.order).to include item 
    end      
  end
  
end
