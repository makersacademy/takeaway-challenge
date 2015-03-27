require 'order'


describe Order do

	
	let(:order){Order.new}
	
	it 'can store dishes into the order' do
		dish = double(dish)
		order.add_dish(dish, 2)
		expect(order.basket).to include dish
		# p order.basket
	end 

	it 'can calculate the total of the order' do
		dish = double(dish, :price => 4)
	 order.add_dish(dish, 4)
	 expect(order.total_amount).to eq 16
	end


end