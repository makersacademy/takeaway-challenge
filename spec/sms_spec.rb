require 'sms'

describe Sms do
  let(:client){ double :client }
  let(:subject){ described_class.new(client)}
  describe '#send'do
    it'should send the user an sms' do
      allow(client).to receive(:messages)
      expect(subject.client.messages).to receive(:create)
      subject.send
    end
  end
end
