require "twilio_manager"

describe TwilioManager do

  it "has send_sms" do
    expect(subject).to respond_to(:send_sms)
  end
  
end
