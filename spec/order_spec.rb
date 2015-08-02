require 'order'

describe Order do

	let (:order){double(:order)}
	it 'should take orders with 2 arguments' do
		expect(subject).to respond_to(:new_order).with(2).argument
	end

	it 'should take order and add it to order' do
		subject.new_order([[2,2],[1,1]],20)
		expect(subject.order).to eq({:FishandChips=>14, :Burger=>6})
	end

	it 'should raise error if incorrect total price' do
		expect{subject.new_order([[2,2],[1,1]],8)}.to raise_error "Total cost is incorrect"
	end

	it 'should raise error if placing empty order' do
		expect{subject.place_order}.to raise_error "No order has been entered"
	end

	it 'can send texts' do
		expect(subject).to respond_to(:send_text)
	end
end
	