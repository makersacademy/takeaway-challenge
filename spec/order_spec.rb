require 'order'

describe Order do
  subject(:order) do
    described_class.new(the_menu:menu, order_calculator: order_calculator,
    message_system: message_system)
  end

  let(:menu) {double :menu}
  let(:order_calculator) {double :order_calculator}
  let(:message_system) {double :message_system}
  let(:dish) {double :dish}

  describe '#add' do
    context 'when dish available' do
      it 'expects to respond to add dish and quantity to order' do
        allow(order).to receive(:on_menu?).and_return true
        expect(order).to respond_to(:add).with(2).arguments
      end
    end

    context 'when dish not available on menu' do
      it 'raises error' do
        allow(menu).to receive(:include_dish?).and_return false
        expect{order.add(dish, 4)}.to raise_error "Not on menu"
      end
    end
  end
  describe '#payment' do
    it 'expects order total to check sum of dishes prices' do
      expect(order).to respond_to(:check_total).with(1).argument
    end

    context 'when expected total doesn\'t match sum of dishes\' prices' do
      it 'raises an error' do
        allow(order_calculator).to receive(:verified?).and_return false
        err = "Unverified order: total does not match order sum. Change payment."
        expect{order.check_total(100)}.to raise_error err
      end
    end

    context 'when expected total matches sum of dishes\' prices' do
      it 'confirms order will be delivered with a text message' do
        allow(message_system).to receive(:send).and_return :msg
        allow(order_calculator).to receive(:verified?).and_return true
        allow(menu).to receive(:include_dish?).and_return true
        expect(order.check_total(37.75)).to eq :msg
      end
    end
  end
end
