require 'order'

describe Order do
  let(:order) { Order.new('LEONA') }
  let(:dishes) { double({ 'halloumi wrap' => 6.50, 'iced tea' => 3.50 }) }
  let(:restaurant) { double('LEONA') }

  describe '#initialize' do
    it 'creates an empty hash to store order summary' do
      expect(order.summary).to be_empty
    end
  end

  describe '#add' do
    it 'takes a dish and quantity as arguments and adds them to the order summary' do
      order.add('iced tea', 2)

      expect(order.summary).to eq({ 'iced tea' => { :quantity => 2, :price => 7.00 } })
    end

    it 'sums quantity if dish is already in the order summary' do
      order.add('halloumi wrap', 1)

      expect { order.add('halloumi wrap', 1) }.to change { order.summary['halloumi wrap'][:quantity] }.from(1).to(2)
    end

    it 'sums price if dish is already in the order summary' do
      order.add('halloumi wrap', 1)

      expect { order.add('halloumi wrap', 1) }.to change { order.summary['halloumi wrap'][:price] }.from(6.50).to(13.00)
    end   
    # it calculates the cost of dish times quantity
    # returns the current order list
  end
# checkout method takes users name, phone number, address, sends a confirmation text, and returns the checkout summary including cost breakdown
# order method prints current order list
end
