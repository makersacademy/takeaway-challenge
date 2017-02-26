require 'sms_confirmation'

describe SMSConfirmation do
  subject(:sms) { described_class.new(client) }
  let(:client) { double :client, messages: messages }
  let(:messages) { double :messages }

  describe '#send_msg' do
    it 'sends a message' do
      expect(messages).to receive(:create)
      sms.send_msg("Rspec test")
    end
  end
end
