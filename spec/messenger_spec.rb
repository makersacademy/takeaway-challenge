require 'messenger'

describe Messenger do
  subject(:messenger) { described_class.new }
  let(:client) { double :client }
  let(:phone) { Dotenv.load['TWILIO_DESTINATION_PHONE'] }

  describe '#send_text' do
    it 'sends a text with a message' do
      message = 'Hello!'
      twilio_message_body = { from: Dotenv.load['TWILIO_PHONE'], to: Dotenv.load['TWILIO_DESTINATION_PHONE'], body: message }
      allow(client).to receive_message_chain(:account, :messages, :create).with(twilio_message_body)
      expect(Twilio::REST::Client).to receive(:new).with(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']).and_return(client)
      messenger.send_text(message, phone)
    end
  end
end