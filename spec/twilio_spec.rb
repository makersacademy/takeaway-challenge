require 'twilio'

describe TwilioClient do
  it "calling method" do
    TwilioClient.send_message("+447404785572")
  end

end
