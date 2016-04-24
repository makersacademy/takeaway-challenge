require 'texter'

describe Texter do
	let(:client){ double(:client, account: account) }
	let(:account){ double(:account, messages: messages) }
	let(:messages){ double(:messages, create: nil) }
	
	let(:time){ Time.new(2016,04,24,10,33,03)}
	subject(:texter){ described_class.new(client) }

	context '#send_confirmation' do
		it 'tells the client to create a text using twilio' do
			expect(client).to receive(:account)
			expect(account).to receive(:messages)
			expect(messages).to receive(:create).with({from: "+441277424334", to: "+447921046417", body: "Thank you! Your order was placed successfully and will be delivered by 11:33"})
			texter.send_confirmation(time)
		end
	end

end