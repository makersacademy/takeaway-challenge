require 'twilio-ruby'

describe TwilioClient do
	subject(:twilio) {TwilioClient.new}

	context "initialization" do
		it 'creates an instance of itself' do
			expect(twilio).to be_an_instance_of TwilioClient
		end
	end

	context "#send_sms" do
		it "has #send_sms method" do
			expect(twilio).to respond_to(:send_sms)
		end

		it '#send_sms sends a message' do
			to = double('to')
			from = double('from')
			body = double('body')
			twilio = double('twilio')
			allow(twilio).to receive(:send_sms).and_return('text sent')
			expect(twilio.send_sms(to, from, body)).to eq('text sent')
		end

	end

end