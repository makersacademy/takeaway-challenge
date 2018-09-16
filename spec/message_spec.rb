require 'message'

describe Message do
  let(:mockMessages) { double :messages, create: nil }
  let(:mockTwilio) { double :twilio, messages: mockMessages }
  subject { described_class.new(mockTwilio) }

  describe '#send_message' do
    it 'responds to the command to create a message on Twilio' do
      subject.send_message
      expect(subject.client).to have_received(:messages)
    end
  end

end
