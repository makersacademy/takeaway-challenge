describe Text do
 
  let(:client) { double :client }
  let(:message) { double :message }
  
  it "sends text with order details" do
    twilio_message_body = { from: ENV["TWILIO_FROM_NUMBER"], to: ENV["TWILIO_TO_NUMBER"], body: message }
    allow(client).to receive_message_chain(:messages, :create).with(twilio_message_body)
    allow(Text).to receive(:twilio_client).and_return(client)
    subject.send_confirmation_text(message)
  end
  
end
