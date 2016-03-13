require 'messenger'
Dotenv.load

describe Messenger do
  let(:client) { double :client, account: account }
  subject(:messenger) { described_class.new(client) }
  let(:account) { double :account, messages: messages }
  let(:messages) { double :message, create: nil }
  let(:phone) { ENV['TWILIO_DESTINATION_PHONE']}
  let(:client) {client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']}

  describe '#send' do
    it '> should send a text message to phone' do
      message = "Rspec Test Passing!"
      twilio = {
        from: ENV['TWILIO_PHONE'],
        to: ENV['TWILIO_DESTINATION_PHONE'],
        body: message}
      messenger.send(message, phone)
    end
  end

end
