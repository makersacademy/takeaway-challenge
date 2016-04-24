require 'order'

describe Order do
	subject(:order) {described_class.new}

	describe '#send_text' do
		before do
    	allow(order).to receive(:send_text)
  	end

	  it 'sends a payment confirmation text message' do
	    expect(order).to receive(:send_text).with("Thank you for your order: £20.93")
	    order.complete_order(20.93)
	  end
	end

end
