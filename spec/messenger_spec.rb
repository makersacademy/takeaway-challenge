require 'messenger'
require 'fake_twilio'

describe Messenger do
  subject(:messenger) { described_class.new(FakeTwilio) }

  describe '#send_message' do
    it 'sends a payment confirmation text message' do
      messenger.send_message(22.95)
      body = 'Thank you for your order: £22.95'
      expect(FakeTwilio.messages.last.body).to eq body
    end
  end
end
