require 'checker'

describe Checker do
	let(:menu){ { item1: {price: 1}, item2: {price: 2}, item3: {price: 3} } }
	
	let(:order_invalid_items){ {item1: 1, item2: 2, item10: 3} }
	let(:order_valid_items){ { item1: 1, item2: 2} }

	context '#check_items' do
		it 'raises an error if the order contains an item not in the menu' do
			expect{subject.check_items(order_invalid_items,menu)}.to raise_error "Sorry, item10 is not on the menu. Please re-order."
		end
		it 'doesn\'t raise an error if all the order items are included in the menu' do
			expect{subject.check_items(order_valid_items,menu)}.not_to raise_error
		end
	end

	context '#check_price' do
		it 'raises an error if the total given is more than the correct price for the order' do
			expect{subject.check_price(100,order_valid_items,menu)}.to raise_error "Sorry, the total price is £5. You have paid £95 too much! Please try again."
		end
		it 'raises an error if the total given is less than the correct price for the order' do
			expect{subject.check_price(1,order_valid_items,menu)}.to raise_error "Sorry, the total price is £5. You need to pay £4 more! Please try again."
		end
		it 'doesn\'t raise an error if the total given equals the correct price for the order' do
			expect{subject.check_price(5,order_valid_items,menu)}.not_to raise_error
		end
	end

	context '#pass?' do
		it 'raises an error if the total given is more or less than the correct price for the order' do
			expect{subject.pass?([4,6].sample,order_valid_items,menu)}.to raise_error
		end
		it 'raises an error if the an order item is not on the menu' do
			expect{subject.pass?(5,order_invalid_items,menu)}.to raise_error
		end
		it 'returns true if the total given is correct and the order items are valid' do
			expect(subject.pass?(5,order_valid_items,menu)).to eq true
		end
	end

end