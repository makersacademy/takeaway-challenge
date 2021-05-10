require 'message'
require 'dotenv'
require 'twilio-ruby'
Dotenv.load


describe Message do
  let(:client) { double :client, messages: messages }
  let(:messages) { double :messages }
  subject(:message) { described_class.new(client) }
  account_sid = 'ACeff89egd532'
  auth_token ='efd674'

  it 'sends an sms message with a delivery time' do

    confirmation_message = "Thank you for your order. Your order has been placed and will be delivered before #{described_class::DELIVERY_TIME}."

    twilio_message_body = {
    from: ENV['TWILIO_PHONE'], 
    to: ENV['TWILIO_DESTINATION_PHONE'],
    body: confirmation_message }

    expect(client).to receive_message_chain(:messages, :create).with(twilio_message_body )

    allow(Twilio::REST::Client).to receive(:new).with(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']).and_return(client)

    message.send 
  end
end