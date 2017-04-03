require 'sms'
describe SMS do
  describe "#send_sms" do
    it 'should send an SMS' do
      VCR.use_cassette('twilio') do
        message = "Your order is on its way"
        subject.send_sms(message)
      end
    end
  end
end
