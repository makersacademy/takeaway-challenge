require 'rspec'
require 'order'

describe Order do
  DISH1_PRICE = 10
  DISH2_PRICE = 12
  let(:dish1) { double :dish1, price: DISH1_PRICE }
  let(:dish2) { double :dish2, price: DISH2_PRICE }
  subject(:order) { described_class.new([dish1, dish2]) }

  context '#initialize' do
    it 'fails if no items were ordered' do
      expect { described_class.new([]) }.to raise_error("Empty order")
    end

    it 'contains ordered items' do
      expect(order.items).to contain_exactly(dish1, dish2)
    end

    it 'has the correct total' do
      expect(order.total).to eq DISH1_PRICE + DISH2_PRICE
    end

    it 'knows the time at which the order was placed' do
      test_time = Time.at(0)
      allow(Time).to receive(:new).and_return(test_time)
      expect(order.time).to eq test_time
    end
  end
end
