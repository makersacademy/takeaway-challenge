require 'sms'

describe SMS do
  let(:twilio) { double :twillio }
  subject(:sms) { described_class.new(twilio) }
  describe '#send_sms' do
    it 'should send an sms test message' do
      expect(twilio).to receive_message_chain('messages.create')
      sms.send()
    end
  end
end
