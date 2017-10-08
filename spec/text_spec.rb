require 'text'

class FakeAway
end

describe Text do
  fakeaway = FakeAway.new
  let(:text) { Text }
  it "sends a text message after the order is placed" do
    fakeaway.extend(text)
    VCR.use_cassette('twilio') do
      fakeaway.send("Thank you! Your order will be delivered before #{(Time.now + 60 * 60).strftime("%H:%M")}")
    end
  end
end
