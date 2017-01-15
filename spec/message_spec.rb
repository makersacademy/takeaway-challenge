require 'message'

describe Message do
  let(:client) { double :client }
  it {is_expected.to respond_to(:send_text).with(1)}

  it 'can send a text' do
    message = 'order complete'
    twilio_message_body = { from: ENV['TWILIO_PHONE'], to: ENV['TWILIO_DESTINATION_PHONE'], body: message }
    allow(client).to receive_message_chain(:messages, :create).with(twilio_message_body)
    expect(Twilio::REST::Client).to receive(:new).with(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']).and_return(client)
    subject.send_text(message)
  end
end
