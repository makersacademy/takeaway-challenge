require 'sms'

describe Sms do
  subject(:sms) { described_class.new }
  it { is_expected.to respond_to(:send_text).with(1).argument }

# struggled with these tests - how to test properly?
  describe '#send_text' do
    it 'sends a payment confirmation text message' do
      order = Order.new
      time = Time.new
      message = "Thank you for your order. It will be delivered at #{time.hour}:#{time.min}"
      allow(sms).to receive(:send_text).with(order) { "Thank you for your order. It will be delivered at 8:32" }
    end
  end
end
