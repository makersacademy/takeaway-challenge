require 'texter'

describe Texter do
  let(:client) { double :client }

  describe '#send_text' do
    it 'tries to send a text' do
      allow(client).to receive(:new) { client }
      text = Texter.new(client)
      allow(client).to receive_message_chain(:messages, :create)
      expect(text.send_text(5)).to eq("sent")
    end
  end
end
