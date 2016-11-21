require 'sms'

describe SMS do

	subject(:sms) { described_class.new }
	let(:client) { double(:client, messages: messages) }
	let(:messages) { double(:messages) }
	let(:delivery_time) { double(:delivery_time) }

	  it 'sends a text message' do
	  	message = "Thank you. Received payment of £5.99. Your order will be delivered by 17:25"
	  	client_arguments = {from: ENV['TWILIO_PHONE'], to: ENV['TWILIO_DESTINATION_PHONE'], body: message }
	  	allow(messages).to receive(:create).with client_arguments
	  	allow(Time).to receive(:now).and_return(Time.parse("16:25"))
	  	expect(Twilio::REST::Client).to receive(:new).with(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']).and_return(client)
	  	subject.send(5.99)

	  end

end