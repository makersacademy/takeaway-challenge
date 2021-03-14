require 'text_message'

describe TextMessage do
  let(:client) { double :client }
  let(:text) { TextMessage.new(client) }
  let(:to) { double :to }
  let(:phone_number) { double :phone_number }
  let(:message) { double :message }
  describe '#send_text_message' do
    it 'should be able to send a text' do
      allow(client).to receive(:new) { client }
      allow(text).to receive(:to) { phone_number }
      allow(client).to receive(:messages) { message }
      allow(message).to receive(:create)
      text.send_text_message(to)
    end
  end
end
