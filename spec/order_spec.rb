require 'order'

describe Order do
  subject(:order) {described_class.new}
  let(:dish) {double :dish}

  describe '#add' do
    it 'expects to respond to add dish and quantity to order' do
      expect(order).to respond_to(:add).with(2).arguments
    end
end
  describe '#payment' do
    it 'expects order total to check sum of dishes prices' do
      expect(order).to respond_to(:check_total).with(1).argument
    end

    context 'when expected total doesn\'t match sum of dishes\' prices' do
      it 'raises an error' do
        allow(order).to receive(:verified?).and_return false
        err = "Unverified order: total does not match order sum. Change payment."
        expect{order.check_total(100)}.to raise_error err
      end
    end

    context 'when expected total matches sum of dishes\' prices' do
      it 'confirms order will be delivered with a text message' do
        allow(order).to receive(:verified?).and_return true
        one_hour = Time.now + 60*60
        one_hour_display = one_hour.localtime.strftime("%H:%M")
        msg = "Thank you!"\
        " Your order was placed and will be delivered before #{one_hour_display}"
        allow(order).to receive(:send_msg).and_return msg
        expect(order.check_total(37.75)).to eq msg
      end
    end
  end
end
