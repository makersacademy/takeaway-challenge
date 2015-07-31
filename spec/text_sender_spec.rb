require 'text_sender'
require 'twilio-ruby'

describe TextSender do
	
	let(:dummy_messages) { double :dummy_messages }
  let(:client) do
		double :client, messages: dummy_messages
	end

	let(:takeaway) { double :person, number: '441613751624' }
	let(:customer) { double :person, number: '447500040420', name: "Lucy" }

	it 'sends a message' do
    expect(dummy_messages).to receive :create

		TextSender.call(message: "Hello", from: takeaway, to: customer, via: client)
	end
end