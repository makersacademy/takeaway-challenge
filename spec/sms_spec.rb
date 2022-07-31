require 'sms'

describe SMS do
  it "Receives a text message after the order is placed" do
    takeaway = double
    time = Time.new + 3600
    allow(takeaway).to receive(:confirmation_message).and_return(
    "Thank you! Your order was placed and will be delivered before #{time.strftime("%H:%M")}")
    
    VCR.use_cassette('twilio') do
      subject.confirmation_text(takeaway.confirmation_message)
    end
  end
end
