require 'twilio_text'
require 'time'

describe TwilioText do

  it "can send text" do
    client = double :client
    allow(client).to receive_message_chain(:messages, :create)
    expect(Twilio::REST::Client).to receive(:new).and_return(client)
    subject.send_text
  end

  it "knows the delivery time" do
    time = Time.parse("Tue Sep 15 14:33:20 GMT 2015")
    allow(Time).to receive(:now).and_return(time)
    expect(subject.time).to eq("15:33")
  end

end