require 'text_message'
require 'mock_text_message'

describe TextMessage do
  let(:mock_module) { MockTextMessage }
  describe '#send' do
    it 'sends a message via the Twilio API' do
      mock_module.send("1234567890")
      expect(mock_module.messages.last.number).to eq("1234567890")
    end
  end

end
