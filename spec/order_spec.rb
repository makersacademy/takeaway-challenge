require 'order'

describe Order do

  subject(:order) { described_class.new }
  let (:sample_order) { ["Lasagne","Lasagne"] }

  describe '#view' do

    it 'blank order when initialized' do
      expect(order.view).to be_empty
    end
  end

  describe '#add' do
    it 'adds single item to current_order' do
      order_size = 1
      order.add("Lasagne", order_size)
      expect(order.view.length).to eq(order_size)
    end

    it 'adds multiple items to current_order' do
      order_size = 5
      order.add("Lasagne",order_size)
      expect(order.view.length).to eq(order_size)
    end

    it 'prevents non-menu items being added to order'do

      expect {order.add("Jibberish", 1)}.to raise_error("Not on menu")

    end



  end

  describe '#current_total' do
    it 'calls order_cost on a menu Class' do

      expect(subject.menu).to receive(:order_cost)
      subject.current_total

    end
  end

  describe '#place_order' do

    before(:example) do
      order.add("Lasagne", 1)

    end
    it 'raises error if confirmation cost does not match order cost' do
      expect { order.place_order(20) }.to raise_error("Expected price does not match order price")
    end

    it 'current_order should be empty after order is placed' do
      order.place_order(10)
      expect(order.view).to be_empty

    end
  end

  describe '#message_generate' do

  end




end
