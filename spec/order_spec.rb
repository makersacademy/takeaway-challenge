require 'menu'
require 'order'

describe 'Order' do
  describe '#initialize' do
    it 'can create a new instantiated Menu' do
      subject = Menu.new(Dish)
      expect(subject).to be_an_instance_of Order
    end
  end
  describe '#create' do
    it 'creates an entry in order array' do
      subject.new(OrderLine)
      expect(subject.create(1 , 1)).to eq(order[0])
    end
    it 'raises an error when no entry matches selection' do
      subject.new(OrderLine)
      expect(subject.create(20 , 1)).to raise_error"Item not in menu"
    end
  end
