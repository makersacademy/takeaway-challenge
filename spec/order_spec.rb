require 'order'

describe Order do

	subject(:order) {Order.new}
	let(:stuff)			{double(:stuff)}

	
	context 'starting basket' do
		
		it 'should be empty' do 
			expect(order.basket).to be_empty		
		end

		it 'should charge nothing' do
			expect(order.total).to eq 0.00
		end
	end
	

	context 'adding to basket' do
    
    it 'changes correct number of items in basket' do
 			expect {order.add(stuff, 4)}.to change {order.basket.count}.by(4)
 		end
	end

	context 'total' do
    
    it 'adds up price of each item' do
			expect {order.add_to_total(4.50, 3)}.to change {order.total}.by(13.50)
		end
	end

	context 'view order' do

		it 'returns string of ordered items' do
			expect(order.view_order).to be_a(String) 
		end
	end
end
