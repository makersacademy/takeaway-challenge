require 'text'
require 'twilio_interface'

RESPONSE = TwilioInterface::TWILIO_200_RESPONSE

describe Text do
  subject = Text.new("body", "8:30\"")
  it "should add body" do
    expect(subject.body).to eq "body"
  end
  it "should add expected time" do
    expect(subject.expected_time).to eq "8:30\""
  end
  it "should send message" do
    twilio_mock = double("twilio_mock", :send_message => RESPONSE)
    subject = Text.new("body", "8:30\"", twilio_mock)
    expect(subject.send_message).to eq(RESPONSE)
  end
  it 'should report error if empty body' do
    twilio_mock = double("twilio_mock", :send_message => RESPONSE)
    subject = Text.new("", "8:30\"", twilio_mock)
    expect { subject.send_message }.to raise_error Text::EMPTY_FIELDS
  end
  it 'should report error if empty time' do
    twilio_mock = double("twilio_mock", :send_message => RESPONSE)
    subject = Text.new("hello", "", twilio_mock)
    expect { subject.send_message }.to raise_error Text::EMPTY_FIELDS
  end
end
