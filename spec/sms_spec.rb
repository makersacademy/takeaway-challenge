require 'sms'

describe Sms do
  subject(:sms) { described_class.new }
  let(:client) { double :client }


  it 'sends a payment confirmation text message' do
    message = "Thank you for your order"
    twilio_message_body = {from: ENV['TWILIO_PHONE'], to: ENV['TWILIO_DESTINATION_PHONE'], body: message }
    allow(client).to receive_message_chain(:messages, :create).with(twilio_message_body)
    expect(Twilio::REST::Client).to receive(:new).with(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']).and_return(client)
    sms.send_text
  end
end
