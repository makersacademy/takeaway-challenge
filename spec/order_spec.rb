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
    it 'takes a dish and quantity, calculates the price, and adds them to the order summary' do
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
    
    it 'returns the current order list' do
      order.add('iced tea', 2)

      expect(order.add('halloumi wrap', 2)).to eq order.summary
    end
  end

  describe '#print' do
    it 'prints the current order list to standard output' do
      order.add('iced tea', 2)
      order.add('halloumi wrap', 2)

      expect { order.print }.to output("2 - iced tea - £7.00\n2 - halloumi wrap - £13.00\n").to_stdout
    end
  end
  # checkout method takes users name, phone number, address, sends a confirmation text, and returns the checkout summary including cost breakdown
end
