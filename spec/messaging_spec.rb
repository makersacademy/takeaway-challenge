require 'messaging'

describe Messaging do
  let(:client) { double :client }

  it 'sends an SMS to destination phone' do
    message = 'Your order is complete!'
    twilio_message_body = { from: ENV['TWILIO_PHONE_NUMBER'], to: ENV['PHONE_NUMBER'], body: message }
    allow(client).to receive_message_chain(:messages, :create).with(twilio_message_body)
    expect(Twilio::REST::Client).to receive(:new).with(ENV['TWILIO_SID'], ENV['TWILIO_AUTH_TOKEN']).and_return(client)
    subject.send_text(message)
  end
end