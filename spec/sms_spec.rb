require 'sms'

describe SMS do

  subject(:sms) {described_class.new}
  let(:client) {double :client}

  before {allow(Twilio::REST::Client).to receive(:new) {client}}

  describe 'send_sms' do
    it 'sends messages to tel numbers' do
      allow(client).to receive_message_chain('account.messages.create')
      expect(sms.send_sms("+441548312031", "test")).to eq "Your message was successfully sent"
    end
  end
end
