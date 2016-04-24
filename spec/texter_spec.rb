require 'texter'

describe Texter do
	let(:client){ double(:client, account: account) }
	let(:account){ double(:account, messages: messages) }
	let(:messages){ double(:messages, create: nil) }
	let(:establishment){ double(:establishment, place_order: nil) }
	
	let(:time){Time.new(2016,04,24,10,33,03)}
	subject(:texter){ described_class.new(client) }

	context '#send_confirmation' do
		it 'tells the client to create a text using twilio' do
			expect(client).to receive(:account)
			expect(account).to receive(:messages)
			expect(messages).to receive(:create).with({from: "+441277424334", to: "+447921046417", body: "Thank you! Your order was placed successfully and will be delivered by 11:33"})
			texter.send_confirmation(time)
		end
	end

	context '#check_for_orders' do
		let(:message1){ double(:message, body: "total:10, item1:1, item2:1", redact: nil) }
		let(:message2){ double(:message, body: "total:10, item1:2, item2:2", redact: nil) }
		let(:message3){ double(:message, body: "total:10, item1:3, item2:3", redact: nil) }

		it 'tells the establishment to place an order using each inbound message not already deleted' do
			allow(messages).to receive(:list).with({to: '+441277424334'}).and_return([message1,message2,message3])
			expect(establishment).to receive(:place_order).with(total:10, order:{item1:1,item2:1})
			expect(establishment).to receive(:place_order).with(total:10, order:{item1:2,item2:2})
			expect(establishment).to receive(:place_order).with(total:10, order:{item1:3,item2:3})
			texter.check_for_orders(establishment)
		end
		it 'redacts each message processed' do
			allow(messages).to receive(:list).with({to: '+441277424334'}).and_return([message1,message2,message3])
			expect(message1).to receive(:redact)
			expect(message2).to receive(:redact)
			expect(message3).to receive(:redact)
			texter.check_for_orders(establishment)
		end
		it 'doesn\'t tell the establishment to place an order in a message already redacted' do
			allow(message1).to receive(:body){""}
			allow(messages).to receive(:list).with({to: '+441277424334'}).and_return([message1])
			expect(establishment).not_to receive(:place_order)
			texter.check_for_orders(establishment)
		end
	end

end