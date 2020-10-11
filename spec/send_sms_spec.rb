require 'send_sms'
require 'fake_sms'

describe Send_SMS do

  it "creates a new client object" do
    subject.send(Time.now)
  end
end
