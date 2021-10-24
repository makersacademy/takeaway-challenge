require 'text'
require 'twilio'

describe Text do
  TWILIO_RESPONSE = "message_sent"
  subject = Text.new("body", "8:30\"")
  it "should add body" do
    expect(subject.body).to eq "body"
  end
  it "should add expected time" do
    expect(subject.expected_time).to eq "8:30\""
  end
  it "should send message" do
    twilio_mock = double("twilio_mock", :send_message => TWILIO_RESPONSE)
    subject = Text.new("body", "8:30\"", twilio_mock)
    expect(subject.send_message).to eq(TWILIO_RESPONSE)
  end
end
