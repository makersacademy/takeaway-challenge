require 'sms'
require 'hour'

describe Sms do

  describe '#send_message' do
    it { is_expected.to respond_to(:send_message) }

    it 'sends a payment confirmation text message' do
      expect(subject).to receive(:send_message).with("Thank you! Your order was placed and will be delivered before #{Hour.new.eta_to_string}")
      Order.new.place_order
    end
  end

end
