require 'takeaway'

describe Takeaway do
  let(:menu) { spy :menu_double }
  let(:dispatcher) { spy :dispatcher_double }
  let(:order_class) { double :order_class_double, new: order }
  let(:order) { spy :order_double }
  let(:subject) { described_class.new(menu, order_class, dispatcher) }
  let(:customer_order) { 'Customer Order' }

  describe '#menu' do
    it 'should send #display_menu to instance of Menu class' do
      subject.menu
      expect(menu).to have_received(:display_menu)
    end
  end

  describe '#order' do
    it 'should create a new order when called, pass order and menu' do
      subject.order(customer_order)
      expect(order_class).to have_received(:new).with(customer_order, menu)
    end
    it 'should tell Order class instance to check if order is correct' do
      subject.order(customer_order)
      expect(order).to have_received(:correct?)
    end
    it 'should raise error on invalid order' do
      allow(order).to receive(:correct?).and_return(false)
      expect { subject.order(customer_order) }.to raise_error('Order total incorrect.')
    end
    it 'should dispatch order on valid order' do
      allow(order).to receive(:correct?).and_return(true)
      expect(subject).to receive(:call_dispatch)
      subject.order(customer_order)
    end
  end

  describe '#call_dispatch' do
    it 'should call dispatcher and pass order_id' do
      allow(order).to receive(:correct?).and_return(true)
      subject.order(customer_order)
      expect(dispatcher).to have_received(:dispatch).with(order.__id__)
    end
  end

end
