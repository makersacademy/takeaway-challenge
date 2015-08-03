require 'order'

describe Order do
	describe '#place_order' do
		it {is_expected.to respond_to(:place_order).with(2).argument}

		it 'allows users to add order with quantities' do
			subject.place_order(3,2)
			expect(subject.order_list[0]).to eq ["Sweet King Prawns", 7.59, 2, 9.18]
		end
	end

	# private method
	# describe '#pay_total' do
	# 	it {is_expected.to respond_to(:pay_total)}
	# 	it 'calculates the total amount that is needed to pay' do
	# 		subject.place_order(3,2)
	# 		subject.pay_total
	# 		expect(subject.order_list.last).to eq ["Total amount: ", "", "", "9.18"]
	# 	end
	# end
	describe '#order_table' do
		it {is_expected.to respond_to(:order_table)}

		xit 'outputs a table of orders and total amount' do
			expect(table[:rows]).to eq order_list
		end
	end

	describe '#pay' do
		it {is_expected.to respond_to(:pay).with(1).argument}

		xit 'raise error if paid amount is different from actual amount' do
			subject.place_order(3,2)
			subject.order_table
			expect{subject.pay(9.00)}.to raise_error "Wrong amount paid"
		end
	end
end