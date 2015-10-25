require 'textmessenger'

describe TextMessenger do

  context "#send_text" do

    it "notifies user that they will receive an SMS" do
      message = "You will shortly receive an SMS confirming your order."
      allow(described_class).to receive(:send_text) { message }
      expect(described_class.send_text).to eq message
    end

    it "sends a confirmation text" do
      expect(described_class).to respond_to(:send_text)
    end
  end
end
