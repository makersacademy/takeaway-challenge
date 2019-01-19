require 'text_message'

describe TextMessage do

  subject(:text_message) { described_class.new }

  describe '#send' do
    it "should return 'sent' once a message is sent" do
      allow(text_message).to receive_message_chain(:client, :messages, :create)
      expect(text_message.send('', '')).to eq('sent')
    end
  end
end
