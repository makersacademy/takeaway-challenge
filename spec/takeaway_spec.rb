require 'takeaway'

describe Takeaway do
  let(:menu) { spy :menu_double }
  let(:order_class) { double :order_class_double, new: order }
  let(:order) { spy :order_double }
  let(:subject) { described_class.new(menu, order_class) }
  let(:customer_order_correct_total) { { 'Gagh' => 2, 'Lemba Bread' => 2, 'Total' => 13.98 } }
  let(:customer_order_incorrect_total) { { 'Gagh' => 2, 'Lemba Bread' => 2, 'Total' => 12.98 } }

  describe '#menu' do
    it 'should respond to #menu' do
      expect(subject).to respond_to(:menu)
    end
    it 'should send #display_menu to instance of Menu class' do
      subject.menu
      expect(menu).to have_received(:display_menu)
    end
  end

  describe '#order' do
    it 'should respond to #order' do
      expect(subject).to respond_to(:order)
    end
    it 'should create a new order when called, pass order and menu' do
      subject.order(customer_order_correct_total)
      expect(order_class).to have_received(:new).with(customer_order_correct_total, menu)
    end
    it 'should tell Order class instance to process the order' do
      subject.order(customer_order_correct_total)
      expect(order).to have_received(:process)
    end
    it 'once order processed either order dispatch or raise an error' do
      allow(order).to receive(:process).and_return(false)
      expect { subject.order(customer_order_correct_total) }.to raise_error('Order total incorrect.')

    end
  end

  describe '#dispatch' do
    it 'should respond to #dispatch' do
      expect(subject).to respond_to(:dispatch)
    end
  end

end
