require 'sms'

describe Sms do
  subject(:sms) { described_class.new }

# struggled with these tests - how to test properly?
  describe '#send_text' do
    it 'sends a payment confirmation text message' do
      sms.send_text
      allow(sms).to receive(:send_text) { "Thank you for your order. It will be delivered at 8:32" }
    end
  end
end
