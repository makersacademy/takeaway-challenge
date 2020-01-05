require 'sms_sender'

describe Sms do
  describe '#send' do
    it 'sends sms' do
      twilio_num = '+15005550006'
      subject = Sms.new(ENV["TWILIO_TEST_ID"], ENV["TWILIO_TEST_TOKEN"], twilio_num)
      expect(subject.send('message', '+15005550010').class).to eq Twilio::REST::Api::V2010::AccountContext::MessageInstance
    end
    it 'raises error if sending to bad number' do
      twilio_num = '+15005550006'
      subject = Sms.new(ENV["TWILIO_TEST_ID"], ENV["TWILIO_TEST_TOKEN"], twilio_num)
      expect{subject.send('message', '+15005550001')}.to raise_error('Number not valid')
    end
  end
end
