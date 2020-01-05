require 'text'

describe Text do
  it "receives a text message after the order is placed" do
    VCR.use_cassette('twilio') do
      subject.send_text
    end
  end
end
