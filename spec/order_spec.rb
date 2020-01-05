require 'menu'
require 'order'

describe 'Order' do
  describe '#initialize' do
    it 'can create a new instantiated Menu' do
      subject = Order.new(OrderLine)
      expect(subject).to be_an_instance_of Order
    end
  end
  describe '#create' do
    it 'creates an entry in order array' do
      subject = Order.new(OrderLine)
      expect(subject.create(1, 1)).to eq(subject.order)
    end
    it 'raises an error when no entry matches selection' do
      subject = Order.new(OrderLine)
      expect { subject.create(20, 1) }.to raise_error 'Item not in menu'
    end
  end

  describe '#total' do
    it 'returns the total cost of an order (0)when no items entered' do
      subject = Order.new(OrderLine)
      expect(subject.total).to eq(0)
    end
    it 'returns a total of 0.75p when popadums selected (first file item)' do
      subject = Order.new(OrderLine)
      subject.create(1, 1)
      expect(subject.total).to eq(0.75)
    end
    it 'returns a total of 6.75p when 1 popadums and 2 onion bhajis selected' do
      subject = Order.new(OrderLine)
      subject.create(1, 1)
      subject.create(3, 2)
      expect(subject.total).to eq(6.75)
    end
  end

  describe '#show' do
    it 'shows an empty order with a total of zero' do
      subject = Order.new(OrderLine)
      expect(subject.show).to eq(nil)
    end
    it 'shows an order with 3 items and a total of ' do
      subject = Order.new(OrderLine)
      subject.create(1, 4)
      subject.create(3, 2)
      subject.create(5, 2)
      expect(subject.show).to eq(nil)
    end  
  end
end
