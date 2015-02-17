require './lib/takeaway'

describe Takeaway do

	let(:order){double :order, total_amount: 10}

	it 'can check an order and raise error if payment is wrong' do
			takeaway = Takeaway.new
			expect{takeaway.process_order(order, 15)}.to raise_error('wrong payment')
			# p takeaway.process_order
	end

end