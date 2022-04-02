require 'twilio'

describe Twilio do
  it 'should be able to send a text message' do
    subject.send_text("to", "message")
  end
end