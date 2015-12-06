require 'takeaway'

describe TakeAway do
  let(:menu) { double :menu, has?: true }
  let(:order) { double :order }
  let(:order_klass) { double :order_klass, new: order}
  let(:takeaway) { described_class.new(menu, order_klass) }

  describe '#add_to_order' do
    it 'adds a dish to the order' do
      expect(order).to receive(:add)
      takeaway.add_to_order('dish1')
    end
    it 'create a new order if there is no one' do
      allow(order).to receive(:add)
      expect(order_klass).to receive(:new)
      takeaway.add_to_order('dish1')
    end
  end
  describe '#basket' do
    it 'raise an error if there is no orders' do
      msg = 'No orders'
      expect { takeaway.basket }.to raise_error msg
    end
  end
  describe '#complete_order' do
    it 'raise an error if there is no orders' do
      msg = 'No orders'
      expect { takeaway.complete_order(10) }.to raise_error msg
    end
  end
  context 'given an order' do
    before do
      allow(order).to receive(:add)
      takeaway.add_to_order('dish1')
    end
    describe '#basket' do
      it 'show the basket summary' do
        expect(order).to receive(:show_basket)
        takeaway.basket
      end
    end
    describe '#complete_order' do
      it 'raise an error if the amount given is different from the total' do
        msg = 'Amount given no correct'
        allow(order).to receive(:total).and_return 5
        expect { takeaway.complete_order(10) }.to raise_error msg
      end
      it 'completes the order' do
        allow(order).to receive(:total).and_return 10
        takeaway.complete_order(10)
        msg = 'No orders'
        expect { takeaway.basket }.to raise_error msg
      end
    end
  end

end
