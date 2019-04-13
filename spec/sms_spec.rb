require 'sms'

describe Sms do
  subject(:sms) { described_class.new }
  it { is_expected.to respond_to(:send_text).with(1).argument }


#struggled with these tests - how to test properly? 
describe '#send_text' do
  it 'sends a payment confirmation text message' do
      order = Order.new
      message = "Thank you for your order"
      allow(sms).to receive(:send_text).with(order) { "Thank you for your order"}
      #expect(sms).to receive(:send_text) { "Thank you for your order"}
      #expect(sms).to receive(:send_text(order)).and_return(message)
  end
end
end
