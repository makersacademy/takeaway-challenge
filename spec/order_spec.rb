require 'order'

describe Order do

let(:order)  {Order.new}

	it 'should have a list of dishes' do
		expect(order.dishes_choice.length).to eq (4)
	end

	it 'should set the order items to 0' do
		expect(order.order_count).to eq (0)
	end

	it 'should be able to add an item' do
		expect(order.add_dish("pesto", 1)).to eq ([1])
		expect(order.selected_dishes).to eq (["pesto"])
	end

	it 'should be able to add quantities' do
		order.add_dish("pesto", 5)
		expect(order.selected_quantities).to eq([5])
	end

	it 'should be able to calculate the cost of the order' do
		expect(order.cost("carbonara",3)).to eq (33)
	end

end