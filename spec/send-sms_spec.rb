require "send-sms"

describe SendSMS do
  it "sends a text" do
    SendSMS.new.send
  end
end
