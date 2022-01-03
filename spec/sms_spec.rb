require "sms"

describe SMS do
  it "sends sms message" do
    allow(subject).to receive(:send_sms)
    expect(subject).to receive(:send_sms)
    subject.send_sms
  end

  it "has the current time + 1 hour stamped on the text" do
    expect(subject.send(:in_an_hour)).to eq (Time.now + 3600).strftime("%I:%M %p")
  end
end
