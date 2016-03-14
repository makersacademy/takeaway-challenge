require 'messenger'
Dotenv.load

describe Messenger do
  subject(:messenger) { described_class.new }
  let(:client) { double :client }
  let(:phone) { ENV['TWILIO_DESTINATION_PHONE'] }
  let(:from_phone) { ENV["TWILIO_PHONE"] }

  describe '#send' do
    it '> should send a text message to phone' do
      allow(Twilio::REST::Client).to receive(:new).and_return client
      message = "Rspec Test Passing!"
      twilio = { from: from_phone, to: phone, body: message}
      expect(client).to receive_message_chain(:account, :messages, :create).with(twilio)
      messenger.send(message, phone)
    end
  end
end
