require 'twilioruby'
require 'env'

describe SendMeAText do
  let(:to) { 4_407_950_670_430 }
  let(:body) { "Thank you for placing an order!" }

  it "Can send a text" do
    twilio_client_class = double()
    client = double()
    message_ready = double()
    
    allow(twilio_client_class).to receive(:new).and_return(client)
    allow(client).to receive(:messages).and_return(message_ready)
    allow(message_ready).to receive(:create).and_return([to,body])

    twilio_ruby = SendMeAText.new(twilio_client_class,"1234","1244")

    expect(twilio_ruby.send_text("20 burgers")).to eq([to,body])
  end
end
