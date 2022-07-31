require 'twilio_interface'
require 'twilio-ruby'

CUSTOMER_PHONE = ENV['MY_PHONE']
RESPONSE = "200"
describe TwilioInterface do
  it "send twilio message should receive http ok response 200" do
    twilio_client = Twilio::REST::Client.new(TwilioInterface::ACCOUNT_SID, TwilioInterface::AUTH_TOKEN)
    subject = TwilioInterface.new(twilio_client)
    allow(twilio_client).to receive_message_chain(:messages, :create).and_return(RESPONSE)
    expect(subject.send_message("jjj", CUSTOMER_PHONE)).to eq(RESPONSE)
  end
end
