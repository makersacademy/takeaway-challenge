require 'text'

describe Text do
  let(:text) { described_class.new }
  it "sends a text message after the order is placed" do
    VCR.use_cassette('twilio') do
      text.send("Thank you! Your order will be delivered before #{(Time.now + 60 * 60).strftime("%H:%M")}")
    end
  end
end
