require 'sms'

describe SMS do

	subject(:sms) { described_class.new }

	it "receives a text message after the order is placed" do
    	VCR.use_cassette('twilio') do
    		sms.send(5.99)
    	end
    end

end