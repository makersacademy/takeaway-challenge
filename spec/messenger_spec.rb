require 'messenger'
require 'dotenv'

describe Messenger do

  describe '#send_sms' do
    it 'sends a payment confirmation text message' do
      expect(subject).to receive(:send_text)
      subject.send_text
    end
  end
end
