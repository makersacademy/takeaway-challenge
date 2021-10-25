require 'twilio_interface'
CUSTOMER_PHONE = ENV['MY_PHONE']
RESPONSE = "200"
describe TwilioInterface do
  it "send twilio message should receive http ok response 200" do
    mock_client= double("mock_client", :messages => RESPONSE, :create => "pp")

    subject = TwilioInterface.new(mock_client)
    expect(subject.send_message("jjj", CUSTOMER_PHONE)).to eq(RESPONSE)
  end
end
