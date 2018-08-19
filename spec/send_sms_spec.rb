require 'send-sms'

describe ".send_sms" do

  it "will send a SMS to the cusomter's phone number" do
    allow(subject).to receive(:send_sms).and_return("SMS sent")
  end

end
