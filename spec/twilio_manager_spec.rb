require "twilio_manager"

describe TwilioManager do

  it "has send_sms" do
    expect(subject).to respond_to(:send_sms)
  end

  it "converts time to a useful string" do
    time = Time.new(2021, 01, 01, 16, 15, 00)
    expect(subject.time_string(time)).to eq "4:15 PM"
  end
  
end
