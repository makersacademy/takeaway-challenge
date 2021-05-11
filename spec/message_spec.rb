require 'message'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load


describe Message do
  let(:messages_double) { double(:messages_double, :create => 'message_sent') }
  let(:client) { double(:client, :messages => messages_double)}
  subject(:message) { described_class.new(client) }

  it 'sends an sms message with a delivery time' do
  
    confirmation_message = "Thank you for your order. Your order has been placed and will be delivered before #{described_class::DELIVERY_TIME}."

    twilio_message_body = { 
      from: ENV['TWILIO_PHONE'], 
      to: ENV['TWILIO_DESTINATION_PHONE'], 
      body: confirmation_message  }

  message.send 
  expect(messages_double).to have_received(:create).with(twilio_message_body)
  end
end