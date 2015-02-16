require 'message_sender'


describe MessageSender do

	let(:time) {double :time, to_s: "2015-02-15 20:48:22 +0000"}
	let(:time2) {double :time, to_s: "2015-02-15 23:48:22 +0000"}
	let(:message_sender) {MessageSender.new}
	let(:twilio) {double :twilio, account_sid: 'AC224c736fce467ca8cf9b8b3bfa73a034', auth_token: 'b4c6b04027185a9860c8e9b429038012', sid: 'SM9acd879d0458458d8bb82fa9cfd22f15'}

	it 'should know what time it is' do
		expect(time).to receive(:to_s)
		expect(message_sender.set_order_time(time)).to eq "20:48"
	end

	it 'should be able to add 1 hour to the order time' do
		expect(time).to receive(:to_s)
		message_sender.set_order_time(time)
		expect(message_sender.delivery_time).to eq "21:48"
	end

	it 'should convert 24 in the output time to 1' do
		expect(time2).to receive(:to_s)
		message_sender.set_order_time(time2)
		expect(message_sender.delivery_time).to eq "00:48"
	end

	it 'should create the output message' do
		expect(time).to receive(:to_s)
		message_sender.set_order_time(time)
		expect(message_sender.sms_message).to eq "Thank you! Your order was placed and will be delivered before 21:48"
	end

	it 'should send the outbound message' do
		expect(time).to receive(:to_s)
		message_sender.set_order_time(time)
		
		
		expect(message_sender.send_message).to eq "SM9acd879d0458458d8bb82fa9cfd22f15"
	end

end