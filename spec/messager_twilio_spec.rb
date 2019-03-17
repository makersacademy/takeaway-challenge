require 'messager_twilio'

describe ConfirmationSenderTwilio do
  subject(:confirmation_sender) { described_class.new(twilio_client) }
  let(:twilio_client) { double :twilio_client }
  let(:twilio_messages) { double :twilio_messages }
  let(:message) { double :message }

  describe "#send" do
    it 'sends a message by calling .messages.create on the Twilio client' do
      allow(twilio_client).to receive(:messages).and_return(twilio_messages)
      allow(twilio_messages).to receive(:create)
      expect(twilio_messages).to receive(:create).with(hash_including(:body => message))
      confirmation_sender.send(message)
    end
  end
end
