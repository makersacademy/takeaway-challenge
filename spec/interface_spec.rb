require 'interface'

describe Interface do
  let(:menu) { double(:menu) }
  let(:order_class) { double(:order_class, new: order_instance) }

  let(:order_instance) do
    double(:order,
    add_to_order: nil,
    review_order: nil,
    checkout: nil)
  end

  let(:adapter) do
    double(:adapter,
    send_sms: nil,
    download_inbound_messages: ['+999','peking duck-2'],
    update_messages: nil)
  end

  let(:options_hash) { { menu: menu, order: order_class, adapter: adapter } }
  subject(:interface) { described_class.new(options_hash) }

  before do
    allow(STDOUT).to receive(:puts)
  end

  context 'Initialization' do
    it 'Saves a menu on initialization' do
      expect(interface.instance_variable_get(:@menu)).to eq menu
    end
    it 'Saves an order class on initialization' do
      expect(interface.instance_variable_get(:@order_class)).to eq order_class
    end
    it 'Has no current order on initialization' do
      expect(interface.instance_variable_get(:@current_order)).to be_nil
    end
  end

  context 'Delegates to Menu class' do
    it 'Tells Menu to Print Menu' do
      expect(menu).to receive(:show_menu)
      interface.show_menu
    end
  end

  context 'Creating an order' do
    describe '#new_order' do
      before do
        interface.new_order
      end
      it 'Sends menu to order instance' do
        expect(order_class).to have_received(:new).with(menu)
      end
      it 'Saves the new order' do
        current_order = interface.instance_variable_get(:@current_order)
        expect(current_order).to eq order_instance
      end
    end

    describe '#order' do
      it 'Raises error if no open order' do
        err = 'Please start a new order'
        expect { interface.order('Spring Rolls') }.to raise_error err
      end
      it 'Delegates ordering to order class - with single item' do
        interface.new_order
        interface.order('Spring Rolls')
        expect(order_instance).to have_received(:add_to_order)
      end
      it 'Delegates ordering to order class - with quantity of item' do
        interface.new_order
        interface.order('Spring Rolls', 4)
        expect(order_instance).to have_received(:add_to_order)
      end
    end

    describe '#review_order' do
      before do
        interface.new_order
        interface.order('Spring Rolls', 4)
      end
      it 'Delegates review to order_instance' do
        interface.review_order
        expect(order_instance).to have_received(:review_order)
      end
    end

    describe '#checkout' do
      before do
        interface.new_order
        interface.order('Spring Rolls', 4)
        interface.checkout(9.90)
      end
      it 'Delegates finishing order to order_instance' do
        expect(order_instance).to have_received(:checkout)
      end
      it 'Resets current_order to nil' do
        expect(interface.instance_variable_get(:@current_order)).to be_nil
      end
      it 'Delegates sms notification to adapter class' do
        expect(adapter).to have_received(:send_sms)
      end
    end
  end

  context 'Filling mobile orders' do
    describe '#check_mobile_orders' do
      before do
        interface.check_mobile_orders
      end
      it 'Gets valid orders from adapter' do
        expect(adapter).to have_received(:download_inbound_messages)
      end
      it 'Resets current_order' do
        expect(interface.instance_variable_get(:@current_order)).to be_nil
      end
      it 'Delegates message update to adapter' do
        expect(adapter).to have_received(:update_messages)
      end
      specify { expect { interface.check_mobile_orders }.to output.to_stdout }
    end
  end
end
