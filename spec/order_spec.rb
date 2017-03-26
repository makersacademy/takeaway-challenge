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



  end

  describe '#current_total' do
    it 'calls order_cost on a menu Class' do

      expect(subject.menu).to receive(:order_cost)
      subject.current_total

    end
  end




end
