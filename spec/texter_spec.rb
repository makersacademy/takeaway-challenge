describe Texter do
  let(:client) { double :client }
  it "sends a text" do
    message = 'order complete'
    twilio_message_body = { from: ENV['TWILIO_PHONE'], to: ENV['MY_PHONE_NUMBER'], body: message }
    allow(client).to receive_message_chain(:messages, :create).with(twilio_message_body)
    expect(Twilio::REST::Client).to receive(:new).with(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']).and_return(client)
    subject.send_text(message)
  end
end
