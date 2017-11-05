require 'twiliosms'

describe Twiliosms do
  it "receives a text message after the order is placed" do
    VCR.use_cassette('twilio') do
      subject.send_conferm_sms
    end
  end
end
