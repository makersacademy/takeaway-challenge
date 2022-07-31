require 'sms'

describe SMS do
  let(:sms) { described_class.instance }
  context 'initializes' do
    it 'with account and auth token' do
      
    end
  end

  context '#send message' do
    it 'can respond to send message' do
      expect(sms).to respond_to(:send_message)
    end
  end
end
