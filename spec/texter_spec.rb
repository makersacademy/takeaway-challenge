require 'texter'

describe Texter do
	let(:client){ double(:client, account: account) }
	let(:account){ double(:account, messages: messages) }
	let(:messages){ double(:messages, create: nil) }
	subject(:texter){ described_class.new(client) }

	context '#send_confirmation' do
		it 'tells the client to create a text using twilio' do
			expect(client).to receive(:account)
			expect(account).to receive(:messages)
			expect(messages).to receive(:create).with({from: "+441277424334", to: "+447921046417", body: "Thank you! Your order was placed successfully and will be delivered an hour from #{Time.now}"})
			texter.send_confirmation
		end
	end

end