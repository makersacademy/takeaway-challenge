require 'message_sender'


describe MessageSender do

	let(:time) {double :time, to_s: "2015-02-15 22:48:22 +0000"}

	it 'should know what time it is' do
		message_sender = MessageSender.new
		expect(time).to receive(:to_s)
		expect(message_sender.order_time(time)).to eq "22:48"
	end

	it 'should be able to add 1 hour to the order time' do


	end


end