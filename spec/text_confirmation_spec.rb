require 'text_confirmation'

describe TextConfirmation do
  let(:client) { double :client }
  let(:message) { double :message }
  let(:messages_client) { double :messages_client }
  subject(:text_confirmation) { described_class.new(client) }

  describe '#send_message' do
    it 'returns a message' do
      time = Time.new
      amount = 10
      message_config = { to: ENV['MY_PHONE_NUMBER'], from: TextConfirmation::CONFIGURATION[:from], body: "Thank you for your order.
Total order price: £#{amount}.
Expected delivery time: #{time.hour + 1}:#{time.min}." }
      allow(client).to receive(:messages).and_return messages_client
      allow(messages_client).to receive(:create).with(message_config).and_return message
      expect(text_confirmation.send_message(amount)).to eq message
    end
  end
end
