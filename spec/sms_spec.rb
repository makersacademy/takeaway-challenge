 require 'Sms'

 describe Sms do
 it "receives a text message after the order is placed" do
    VCR.use_cassette('twilio') do
      subject.send
    end
  end
 end