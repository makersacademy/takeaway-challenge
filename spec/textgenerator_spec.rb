require 'textgenerator'

describe Text do

  let(:twilio_client) { double(:textgenerator) }

  describe '#send_message' do
    it "sends a message when an order is placed" do
      expect(twilio_client.send_message).to eq true
    end
  end
end
