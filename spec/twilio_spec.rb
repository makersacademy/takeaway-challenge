require 'twilio'

describe TwilioClient do
  it "calling method" do
    TwilioClient.send_message
  end

end