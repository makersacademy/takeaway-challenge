require 'text_message'

describe TextMessage do
  let(:messages) { double :messages }
  let(:client) { double :client, messages: messages }

  describe '#initialization' do
    it "sends a message" do
      expect(messages).to receive(:create)
      TextMessage.new(client: client)
    end
  end
end
