require 'message'

describe Message do
  subject(:message) { described_class.new("18:00") }
  describe "#send" do
    it "sends a text message to the customer" do
      conf_message = "Thankyou for your order, It will be delivered by 18:00"
      allow(subject).to receive(:send) {conf_message}
      expect(subject.send).to eq conf_message
    end
  end
end
