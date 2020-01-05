describe Text do

  let(:client) { double :client }
  let(:message) { double :message }

  it "sends text with order details" do
    twilio_message_body = { from: ENV["TWILIO_FROM_NUMBER"], to: ENV["TWILIO_TO_NUMBER"], body: message }
    allow(client).to receive_message_chain(:messages, :create).with(twilio_message_body)
    expect(Twilio::REST::Client).to receive(:new).with(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']).and_return(client)
    subject.send(message)
  end

end
