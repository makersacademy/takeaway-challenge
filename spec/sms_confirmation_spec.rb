require 'sms_confirmation'

describe SmsConfirmation do

	describe '#send' do
		subject(:sms) { SmsConfirmation.new }
    it "sends a text message via Twilio" do
      VCR.use_cassette('twilio') do
        sms.send
      end
    end
	end
  
end
