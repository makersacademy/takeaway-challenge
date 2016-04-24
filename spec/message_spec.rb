require 'message'

describe Message do
	subject(:message) {described_class.new}

	describe '#send_text' do
		before do
    	allow(message).to receive(:send_text)
  	end

	  it 'sends a payment confirmation text message' do
	  	time = (Time.now + 60*60).strftime("%H:%M")
	    expect(message).to receive(:send_text).with("Thank you for your order: £20.93. Expect your food by #{time} ")
	    message.complete_order(20.93)
	  end
	end

end
