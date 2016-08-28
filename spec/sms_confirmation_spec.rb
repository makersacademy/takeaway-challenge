require 'sms_confirmation'

describe SMSConfirmation do
  subject(:sms) { described_class.new(client) }
  let(:client) { double :client, messages: messages }
  let(:messages) { double :messages }


  describe '.send_text' do
    it 'sends a text' do
      expect(messages).to receive(:create)
      sms.send_text("Rspec Test")
    end
  end
end
