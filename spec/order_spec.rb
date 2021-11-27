require 'order'

TEST_PRICE = 8

describe Order do
  subject(:order) { described_class.new }
  item = { "Fried Chicken": TEST_PRICE }

  describe '#initialize' do
    it 'contains list of items' do
      expect(order.items).to be_an_instance_of(Array)
    end
  end

  describe '#summary' do
    it 'shows a formatted order summary' do
      order.items << item
      expect { order.summary }.to output("Fried Chicken - £8\n").to_stdout
    end
  end

  describe '#total' do
    it 'calculates the total of the order' do
      2.times { order.items << item }
      expect(order.total).to eq("Total: #{TEST_PRICE * 2}")
    end
  end

  describe '#complete' do
    it 'sends a confirmation text' do
      order.items << item
      allow(order).to receive(:send_text)
      expect(order).to receive(:send_text).with("Thank you! Your order was placed and will be delivered before #{(Time.now + (60 * 60)).strftime("%k:%M")}.")
      order.complete
    end
  end
end
