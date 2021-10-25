require 'twilio_interface'
CUSTOMER_PHONE = ENV['MY_PHONE']
RESPONSE = "200"
describe TwilioInterface do
  it "send twilio message should receive http ok response 200" do
    subject = TwilioInterface.new
    allow(subject).to receive_message_chain(:messages, :create).and_return(RESPONSE)
    expect(subject.send_message("jjj", CUSTOMER_PHONE)).to eq(RESPONSE)
  end
end
