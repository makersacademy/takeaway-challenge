require 'messager'

describe Messager do
  twilio_account_sid = 'fake_sid'
  twilio_token = 'fake_token'
  let(:twilio_messages) { double("TwilioMessages") }
  let(:twilio_client) { double("TwilioClient", messages: twilio_messages) }
  let(:twilio_client_class) { double("TwilioClientClass", new: twilio_client) }
  
  subject(:messager) { described_class.new(twilio_account_sid, twilio_token, twilio_client_class) }

  context 'on creation' do
    it 'creates a Twilio client' do
      expect(twilio_client_class).to receive(:new).with(twilio_account_sid, twilio_token)
      described_class.new(twilio_account_sid, twilio_token, twilio_client_class)
    end
    it 'has an API client' do
      expect(messager.client).to eq twilio_client
    end
  end

  describe '#send_message' do
    it 'sends creates new messages through API client' do
      to = ENV['TWILIO_TO']
      expect(twilio_client).to receive(:messages)
      expect(twilio_messages).to receive(:create).with(from: ENV['TWILIO_FROM'], to: to, body: "This is a test")
      messager.send_message(to, "This is a test")
    end
  end
end
