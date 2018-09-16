require 'order'

describe Order do
  subject(:order) { described_class.new(sms) }
  let(:dish) { double :dish, :name => 'steamed pork dumpling', :price => 1.50 }
  let(:sms) { double :sms }

  describe '#add_dish' do
    it 'should add a dish to the order' do
      order.add_dish(dish, 1)
      expect(order.basket).to include(dish: dish, quantity: 1)
    end
  end

  describe '#total' do
    it 'should = 0 with no dishes ordered' do
      expect(order.total).to be_zero
    end
    it 'should give the price of a single item' do
      order.add_dish(dish, 1)
      expect(order.total).to eq 1.50
    end
    it 'should give the price of multiple items' do
      order.add_dish(dish, 1) # £1.50
      order.add_dish(dish, 3) # £4.50
      expect(order.total).to eq 6 # £6.00
    end
  end

  describe '#place_order' do
    def one_hours_time
      now = Time.new
      "%02d" % (now.hour + 1) + ":" + "%02d" % now.min
    end
  
    before do
      order.add_dish(dish, 2)
      allow(sms).to receive(:send)
    end

    it 'should send an sms' do
      expect(sms).to receive(:send).with(
        "Thank you! Your order was placed and will be delivered before #{one_hours_time}"
      )
      order.place_order
    end

    it 'should empty the basket once the order is placed' do
      order.place_order
      expect(order.basket).to be_empty
    end
  end
end
