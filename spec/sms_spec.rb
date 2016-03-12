require 'sms'

describe SMS do

  subject(:sms) { described_class.new(client) }
  let(:client) { double :client, account: account }
  let(:account) { double :account, messages: messages }
  let(:messages) { double :messsages, create: nil }

  describe '#send_sms' do
    it 'should receive a message indicating an sms should be sent' do
      expect(messages).to receive(:create)
      sms.send_sms
    end
  end

end
