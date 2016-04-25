require 'sms'

describe SMS do

	let(:client) { double(:client, messages: messages ) }
	let(:messages) { double(:messages, create: config) }
	let(:config) do
		{
			from: "+311234124",
			to: "+222222",
			body: SMS::DEFAULT_MESSAGE
		}
	end
	let(:sms) { described_class.new("AC12532f23f252", "AC154t43435", config, client) }

		describe '#send_message' do
		it 'delivers a message given a set of configuration' do
			sms.send_message
			expect(messages).to have_received(:create).with(config)
		end

		it 'sends a message with the correct time' do
			sms.send_message
			expect(sms.delivery_time).to eq (Time.new + 3600).strftime("%H:%M")
		end
	end
end