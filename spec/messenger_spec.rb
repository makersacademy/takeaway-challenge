require 'messenger'

describe Messenger do

  describe '#send_sms' do
    it 'sends a payment confirmation text message' do
      expect(subject).to receive(:send_text)
      subject.send_sms
    end
  end
end
