require 'twilio_messanger'

describe TwilioMessanger do

  let(:client) { double :client }
  it "can send text" do
    message = 'order complete'
    twilio_message_body = { from: ENV['TWILIO_NUMBER'], to: ENV['TWILIO_MY_NUMBER'], body: message }
    allow(client).to receive_message_chain(:account, :messages, :create).with(twilio_message_body)
    expect(Twilio::REST::Client).to receive(:new).with(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']).and_return(client)
    subject.message(message)
  end

end
