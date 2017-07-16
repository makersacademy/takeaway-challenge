require "text"

describe Text do
  let(:phone_number) { double(:string) }
  let(:time) { Time.new + Text::DELIVERY_DELAY }
  subject(:text) { described_class.new(phone_number) }

  describe "initialization" do
    it "should receive a phone number at initialization" do
      expect(text.number).to eq phone_number
    end
  end

  describe "#message_creator" do
    it "should return a string stating the delivery time" do
      expect(text.message_creator).to eq "Thank you! Your order was placed and will be delivered before #{time.hour}:#{time.min}"
    end
  end

  describe "#send" do
    it"should send a text to the user's number" do
      response = VCR.use_cassette('twilio') do
        text.send
      end
      expect(response.body).to eq "Thank you! Your order was placed and will be delivered by 13:22"
    end
  end
end
