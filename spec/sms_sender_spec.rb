require './lib/sms_sender'

describe SmsSender do
  let(:client) { double :client, messages: nil, create: nil }
  subject(:text_sender) { described_class.new(client) }
  describe "#text_confirmation" do
    it "should call the methods messages.create on client" do
      expect(text_sender.client.messages).to receive(:create).with(anything)
      text_sender.text_confirmation
    end
  end
end
