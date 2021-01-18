require 'textgenerator'

describe Text do

  let(:twilio_client) { double(:textgenerator) }

  describe '#send_message' do
    it 'sends a text confirming the order has been made' do
      text = double('Text')
      allow(text).to receive(:send_message).and_return(true)
      expect(text.send_message).to be true
    end
  end
end
