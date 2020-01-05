require 'send_sms'

describe 'SendSMS' do
  describe '#initialize' do
    it 'can create a new instantiated SendSMS object' do
      subject = SendSMS.new
      expect(subject).to be_an_instance_of SendSMS
    end
  end
  describe '#send' do
    it 'can send a message' do
      subject = SendSMS.new
      subject.send(12.00)
      expect_any_instance_of(TwilioAdapter).to 
      receive(:send_sms).with(hash_including(:body, :to))
    end
  end
end
