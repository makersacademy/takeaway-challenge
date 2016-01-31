require 'sms_handler'

describe SmsHandler do
  subject(:sms_handler) { described_class.new }
  let(:client) { double(:client) }
  let(:message) { double(:message) }

  describe '#send_sms' do
    it 'makes a new client' do
      allow(client).to receive_message_chain(:messages, :create)
      expect(Twilio::REST::Client).to receive(:new).
        with(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']).
        and_return(client)
      sms_handler.send_sms(message)
    end

    it 'runs .messages.create method on client to send text' do
      twilio_message_body = {
        from: ENV['FROM_PHONE'],
        to: ENV['TO_PHONE'],
        body: message
      }
      allow(Twilio::REST::Client).to receive(:new).and_return(client)
      expect(client).to receive_message_chain(:messages, :create).
        with(twilio_message_body)
      sms_handler.send_sms(message)
    end
  end
end
