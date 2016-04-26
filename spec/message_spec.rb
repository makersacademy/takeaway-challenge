require 'message'

describe Message do

  subject(:message) { described_class.new }
  let (:message_body) { "Thank you! Your order will be delivered before 15.65!" }


  describe '#send' do
    it 'sends a message confirming the order' do
      allow(message).to receive(:send) { message_body }
      expect(message.send).to eq message_body
    end

    it 'calls twilio_send' do
      expect(message).to receive(:send).and_return true
      message.send
    end
  end
end
