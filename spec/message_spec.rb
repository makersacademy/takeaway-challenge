require "message"

describe Message do
  let(:message) {double("message", sending: "Thanks! :)")}
  context "responds to method" do
    it "#send" do
      expect(subject).to respond_to(:sending)
    end
  end
  context "method functionality" do
    it "sends a message" do
      expect(message.sending).to eq("Thanks! :)")
    end
  end
end