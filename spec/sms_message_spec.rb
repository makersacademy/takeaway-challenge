require 'sms_message'

describe SMSMessage do
  subject(:message){ described_class.new }
  let(:aclient){ double(:Client, messages: messages) }
  let(:messages){ double(:message, create: nil) }
  let(:list) { {rice: 3, pea: 2} }
  before(:each){ allow(message).to receive(:client){aclient} }

  describe "#send" do
    it 'sends a text message' do
      allow(message).to receive(:client){aclient}
      expect(messages).to receive(:create)
      message.send(list)
    end
  end


end
