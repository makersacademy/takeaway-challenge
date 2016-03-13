require 'messenger'

describe Messenger do
  let(:client) { double :client, account: account }
  subject(:messenger) { described_class.new(client) }
  let(:account) { double :account, messages: messages }
  let(:messages) { double :message, create: nil }
  let(:phone) { Dotenv.load['TWILIO_DESTINATION_PHONE']}
  let(:client) {client = Twilio::REST::Client.new Dotenv.load['TWILIO_ACCOUNT_SID'], Dotenv.load['TWILIO_AUTH_TOKEN']}

  describe '#send' do
    it '> should send a text message to phone' do
      message = "Rspec Test Passing!"
      twilio = {
        from: Dotenv.load['TWILIO_PHONE'],
        to: Dotenv.load['TWILIO_DESTINATION_PHONE'],
        body: message}
      messenger.send(message, phone)
    end
  end

end
