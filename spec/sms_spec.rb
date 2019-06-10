require 'sms'

RSpec.describe SMS do
	subject(:sms) { described_class.new(config, client: client) }
	let(:client) { double(:client, messages: messages) }
	let(:messages) { spy(:messages) }

	let(:config) do
		{
		account_sid: ENV['TWILIO_ACCOUNT_SID'],
		auth_token: ENV['TWILIO_AUTH_TOKEN'],
		from: ENV['TWILIO_PHONE_FROM'],
		to: ENV['TWILIO_TO_NUMBER'],
		body: "Thank you! Your order will be delivered before %s" 
		}
	end

	it 'delivers an SMS with the estimated time' do
		args = {
		from: config[:from],
		to: config[:to],
		body: "Thank you! Your order will be delivered before 18:52"
		}

		allow(Time).to receive(:now).and_return(Time.parse("17:52"))
		sms.deliver
		expect(messages).to have_received(:create).with(args)
	end
end
