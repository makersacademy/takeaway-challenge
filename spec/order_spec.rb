require 'order'
require 'takeaway'

describe Order do
  let(:dish) { 'Chicken Poke' }
  let(:quantity) { 3 }
  let(:price) { 7.99 }
  let(:subject) { described_class.new(dish, quantity, price) }

  describe '#initialize' do
    it 'initialize the class with two argument' do
      expect { subject.to respond_to(:new).with(3).argument }
    end
  end

  describe '#order_price' do
    it 'calculate the total price of a single order' do
      result = 23.97
      expect(subject.order_price).to eq result
    end
  end
end
