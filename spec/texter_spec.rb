require 'texter'

describe Texter do
  let(:client) { double :client }

  describe '#send_text' do
    it 'tries to send a text' do
      allow(client).to receive(:new) { client }
      text = Texter.new(client)
      expect(client).to receive_message_chain(:messages, :create)
      text.send_text(5)
    end
  end
end
