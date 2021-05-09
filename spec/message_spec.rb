require 'message'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load


describe Message do
  let(:client) { double :client}
  subject(:message) { described_class.new(client: client) }

  it 'sends an sms message with a delivery time' do
  
    confirmation_message = "Thank you for your order. Your order has been placed and will be delivered before #{described_class::DELIVERY_TIME}."

    twilio_message_body = { 
      from: ENV['TWILIO_PHONE'], 
      to: ENV['TWILIO_DESTINATION_PHONE'], 
      body: confirmation_message  }

      allow(client).to receive(:messages).and_return("client_messages")
      allow("client_messages").to receive(:create).with(twilio_message_body)
    # allow(client).to receive_message_chain(:messages, :create)

    expect(Twilio::REST::Client).to receive(:new).with(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']).and_return(client)  
      
    message.send 
  expect { takeaway.place_order(dishes) }.to output(confirmation_message).to_stdout
  end
end 