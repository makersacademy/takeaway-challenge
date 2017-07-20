require 'msg_sender'

describe MsgSender do

  subject(:text) { described_class.new }

  before do
    allow(text).to receive(:send_text)
  end

  describe '#send_text' do
    it 'sends a payment confirmation text message' do
      expect(text).to receive(:send_text).with("Thank you! Your order was placed and will be delivered in 1 hour")
      text.complete_order
    end
    it 'sends a text when prompted' do
      allow(text).to receive(:send_text) { "Thank you! Your order was placed and will be delivered in 1 hour" }
      expect(subject.send_text).to eq "Thank you! Your order was placed and will be delivered in 1 hour"
    end
  end
end
