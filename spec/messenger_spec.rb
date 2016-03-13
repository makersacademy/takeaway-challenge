require 'messenger'
Dotenv.load

describe Messenger do
  subject(:messenger) { described_class.new }
  let(:client) { double :client }
  let(:phone) { ENV['TWILIO_DESTINATION_PHONE'] }

  describe '#send' do
    it '> should send a text message to phone' do
      message = "Rspec Test Passing!"
      twilio = { from: @from_phone, to: phone, body: message}
      allow(client).to receive_message_chain(:account, :messages, :create).with(twilio)
      messenger.send(message, phone)
    end
  end

end
