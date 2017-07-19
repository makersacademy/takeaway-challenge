require 'confirmation'

describe Confirmation do
  subject(:confirmation) { described_class.new(client) }
  let(:messages) { double :something }
  let(:client) { double :anything, messages: messages}
  let(:delivery_time) { "15:50" }
  let(:text) do
    {
      body: "Thank you! The order was placed and will be delivered before #{delivery_time}",
      to: ENV['SEND_TO'],
      from: ENV['FROM']
    }
  end
  context "client provided" do
    it "must call create on messages" do
      expect(confirmation).to receive(:delivery_time).and_return(delivery_time)
      expect(messages).to receive(:create).with(text)
      confirmation.sent_text
    end
  end

  context "no client provided" do
    subject(:confirmation) { described_class.new }
    it "must create a message" do
      expect(confirmation).to receive(:delivery_time).and_return(delivery_time)
      expect_any_instance_of(Twilio::REST::Client).to receive(:messages).and_return(messages)
      expect(messages).to receive(:create).with(text)
      confirmation.sent_text
    end
  end

end
