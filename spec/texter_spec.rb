require 'texter'

describe Texter do
	let(:client){ spy(:client) }
	subject(:texter){ described_class.new(client) }

	context '#send_confirmation' do
		it 'tells the client to create a text using twilio' do
			texter.send_confirmation
			expect(client).to have_received(:account,:messages,:create).with({from: "+441277424334", to: "+447921046417", body: "Thank you! Your order was placed successfully and will be delivered an hour from #{Time.now}"})
		end
	end

end