require "sms_messager.rb"

describe SMSMessager do

  subject(:sms_messager) { described_class.new }
  let(:client) { double("TwilioClient") }
  let(:messages) { double("Messages") }
  it { is_expected.to respond_to(:message).with(1).argument }

  describe "#message" do
    it "calls to TwilioClient without raising error" do
      allow(client).to receive(:messages) { messages }
      allow(messages).to receive(:create)
      expect{sms_messager.message("message string")}.not_to raise_error
    end
  end
end
