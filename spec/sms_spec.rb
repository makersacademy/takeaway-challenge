require 'sms'

describe SMS do
	subject(:sms){ described_class.new(config, client:client) }

	let(:client){ double(:client, messages:messages) }
	let(:messages){ spy(:messages) }

	let(:config) do 
		{
			account_sid: "C3462f5dec",
			auth_token: "01d58",
			from: "+440750",
			to: "+4407501",
			body: "Thank you! Your order was placed and will be delivered before %s"
		}
	end

	it 'send msg with time 1 hour from now' do
		args = {
			from: config[:from],
			to: config[:to],
			body: "Thank you! Your order was placed and will be delivered before 18:00"
		}

		allow(Time).to receive(:now).and_return(Time.parse("17:00"))
		sms.send
		expect(messages).to have_received(:create).with(args) #different way to test using a spy, show by sam
	end
end