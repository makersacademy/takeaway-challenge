require 'send_sms'

describe SendSMS do
  describe '#send' do
    it 'sends a sms' do
      expect(subject).to receive(:send)
      subject.send
    end
  end
end