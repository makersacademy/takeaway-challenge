require 'sms_handler'

describe SmsHandler do
  subject(:sms_handler) { described_class.new }
  let(:client) { double(:client) }

  describe '#send' do
    it 'makes a new client' do
      allow(client).to receive_message_chain(:messages, :create)
      expect(Twilio::REST::Client).to receive(:new).
        with(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']).
        and_return(client)
      sms_handler.send(rand)
    end

    it 'calls .messages.create method on client to send text' do
      twilio_message_body = {
        from: ENV['FROM_PHONE'],
        to: ENV['TO_PHONE'],
        body: sms_handler.message(1)
      }
      allow(Twilio::REST::Client).to receive(:new).and_return(client)
      expect(client).to receive_message_chain(:messages, :create).
        with(twilio_message_body)
      sms_handler.send(1)
    end
  end
end
