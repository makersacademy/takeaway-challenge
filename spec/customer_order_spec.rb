require 'customer_order'

describe 'CustomerOrder' do 

let(:menu) { double :menu, :menu_list => {"oranges" => 1, "pears" => 2}, :find => 1}
#let(:menu) {double :menu, :menu_list => }

	describe '#initiaize' do

		it 'will create an empty array' do
			order = CustomerOrder.new(menu)
			expect(order.my_order).to be_empty
		end
	end	

	describe '#add to order' do
		
		it 'will add to my_order' do
			order = CustomerOrder.new(menu)
			expect{order.add_to_order("oranges",4)}.to change{order.my_order.length}.by 1
		end
	end
end