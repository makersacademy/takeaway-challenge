require "sms_sender"

describe SmsSender do

  subject(:sms_sender) { described_class.new }
  let(:client) { double :client, account: account }
  let(:account) { double :account, messages: messages }
  let(:messages) { double :messsages, create: nil }

  describe "#send_sms" do
    it "should receive a message indicating an sms should be sent" do
      allow(sms_sender).to receive(:client) { client }
      expect(messages).to receive(:create)
      sms_sender.send_sms
    end
  end
end
