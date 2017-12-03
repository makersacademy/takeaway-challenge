require 'notification'

describe Notification do
  let(:client) { double :client }
  it "should send a confirmation text to the customer" do
    message = "Order processed."
    message_body = { from: ENV['TWILIO_NUMBER'], to: ENV['CUSTOMER_NUMBER'], body: message }
    allow(client).to receive_message_chain(:api, :account, :messages, :create).with(message_body)
    expect(Twilio::REST::Client).to receive(:new).with(ENV['TWILIO_ID'], ENV['TWILIO_TOKEN']).and_return(client)
    subject.send_text(message)
  end
end
