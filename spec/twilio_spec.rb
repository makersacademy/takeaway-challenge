require 'twilio'

describe Twilio do
  it "Can calculate time" do
    time = Time.now + (3600)
    expect(subject.timer).to eq time.to_s.split(' ')[1]
  end
end
