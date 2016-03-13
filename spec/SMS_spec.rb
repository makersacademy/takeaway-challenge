require 'sms'

describe SMS do

subject(:sms) { described_class.new }
let(:client) { double :client, messages: messages }
let(:messages) { double :messages, create: nil }
before(:each){ allow(sms).to receive(:client){client} }

  describe '#send sms'  do
    it 'should send an sms' do
      expect(messages).to receive(:create)
      subject.send
    end
  end
end
