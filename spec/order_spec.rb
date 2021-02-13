require 'order'

describe Order do
  it 'should store the items ordered' do
    expect(subject).to respond_to(:items_ordered)
  end
  it 'should store the price of each item ordered' do
    expect(subject).to respond_to(:items_price)
  end

  describe '#add_to_order' do
    it 'should take one or two arguments' do
      expect(subject).to respond_to(:add).with(1..2)
    end
    it 'should add the item and price to the order' do
      my_order = Order.new
      my_order.add('pizza', 3)
      expect(my_order.items_ordered).to contain_exactly('pizza', 'pizza', 'pizza')
    end 
  end
end
