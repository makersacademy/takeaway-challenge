require 'message'
require 'twilio-ruby'
require 'dotenv/load'

describe Message do
  subject(:message) { described_class.new(client: client)}
  let(:client)  { double :client}

  xit 'sends an sms message with a delivery time' do
    confirmation_message = "Thank you for your order. Your order has been placed and will be delivered before #{described_class::DELIVERY_TIME}."

    twilio_message_body = { 
      from: ENV['TWILIO_PHONE'], 
      to: ENV['TWILIO_DESTINATION_PHONE'], 
      body: confirmation_message  }

    allow(client).to receive_message_chain(:messages, :create).with(twilio_message_body)

    expect(Twilio::REST::Client).to receive(:new).with(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']).and_return(client)  
      
    message.send 
    # message.send(confirmation_message)
  # expect { takeaway.place_order(dishes) }.to output(confirmation_message).to_stdout
  end
end 