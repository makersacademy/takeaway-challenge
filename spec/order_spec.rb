require 'order'

describe Order do

	subject(:order)  	{Order.new}
	let(:food)			{double(:food)}

	
	context 'before adding any items' do
		
		it 'the order should be empty' do 
			expect(order.current_order).to be_empty		
		end

		it 'the total price should be zero' do
			expect(order.total).to eq 0
		end

	end
	

	describe '#add' do
		it 'adds items to the current order' do
 			expect {order.add(food, 2)}.to change {order.current_order.count}.by(2)
 		end
	end

	describe '#add_to_total' do
		it 'adds the price of each item to the total' do
			expect {order.add_to_total(3.50, 2)}.to change {order.total}.by(7.0)
		end
	end

	describe '#print_order' do

		it 'returns a list of ordered items as a string' do
			expect(order.print_order).to be_a(String) 
		end

	end
	
end