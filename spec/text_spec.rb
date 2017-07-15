require "text"

describe Text do
  let(:phone_number) { double(:string) }
  let(:client) { double(:client) }
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
    before do
      allow(text).to receive(:client) { client }
      allow(client).to receive_message_chain(:messages, :create) { double(:message) }
    end
    it "should send a text to the user's number" do
      expect(text.send).to eq "Message sent"
    end
  end
end
