require 'takeaway'

describe Takeaway do

	subject(:takeaway) { described_class.new(sms_klass, order_klass) }
	let(:sms_klass) { double(:sms_klass) }
	let(:order_klass) { double(:order_klass, new: order) }
	let(:order) { double(:order) }

	describe '#place_order' do

		it 'should add items to the order' do
			allow(order).to receive(:basket)
			expect(order).to receive(:add).with(1, 1)
			takeaway.place_order(1, 1)
		end

	end

	describe '#check_total' do

		it 'displays the total of the current order' do
			allow(order).to receive(:add).with(1, 1)
			allow(order).to receive(:basket)
			takeaway.place_order(1, 1)
			allow(order).to receive(:order_total) { 5.99 }
			expect(takeaway.check_total).to eq "Total: £5.99"
		end

	end

	describe '#pay' do

		it 'expects an order to have been created before you can pay' do
			message = "Order has not been created."
			expect{(takeaway.pay(6.99))}.to raise_error message
		end

		it 'expects payment total to be correct' do
			allow(order).to receive(:add).with(1, 1)
			allow(order).to receive(:basket)
			takeaway.place_order(1, 1)
			allow(order).to receive(:order_total) { 6.99 }
			message = "Payment amount is incorrect."
			expect{(takeaway.pay(5.99))}.to raise_error message
		end

	end

end