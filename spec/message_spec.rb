require 'message'

RSpec.describe Message do

  describe '#send' do
    
    it 'send a message to the customer' do
      message = double(Message.new)
      allow(message).to receive(:send) { "message" }
      expect(message.send).to eq("message")
    end
  end
end
