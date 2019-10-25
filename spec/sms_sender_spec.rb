require "sms_sender"

describe SMSSender do
  let(:twilio) { double :twilio }
  let(:new_client) { double :new_client }
  let(:client) { double :client }
  let(:messages) { double :messages }
  subject(:sms_sender) { described_class.new(:twilio_client => twilio) }

  describe "#message" do
    it "calls to TwilioClient without raising error" do
      allow(twilio).to receive(:new) { new_client }
      allow(new_client).to receive(:client) { client }
      allow(client).to receive(:messages) { messages }
      allow(messages).to receive(:create) { true }
      expect { sms_sender.message("message string") }.not_to raise_error
    end
  end
end
