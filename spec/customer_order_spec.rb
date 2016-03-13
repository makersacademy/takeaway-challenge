require 'customer_order'

describe 'CustomerOrder' do 

let(:menu) { double :menu, :menu_list => {"oranges" => 2, "pears" => 2}, :find => 1}
let(:menu1) { double :menu1, :menu_list => {"oranges" => 1, "pears" => 2}, :find => nil}
let(:order)	{ CustomerOrder.new(menu,"bob","032858565") }
let(:order1) { CustomerOrder.new(menu1,"bob","032858565") }

	describe '#initiaize' do

		it 'will create my_order as an empty array' do		
			expect(order.my_order).to be_empty
		end

	end	

	describe '#add_to_order' do
		
		it 'will add a dish, price and quatity to my_order' do
			expect{order.add_to_order("oranges",4)}.to change{order.my_order.length}.by 1
		end

		it 'will fail if the dish is not on the menu' do
			expect{order1.add_to_order("banana",2)}.to raise_error "banana is not on the menu."
		end

	end

	describe '#remove_from_order' do
		
		it 'will remove a quantity of a particular dish, from my_order' do
			order.add_to_order("oranges",4)
			selected = order.current_menu.select {|k,v| k == "oranges" }
			expect{order.remove_from_order("oranges",1)}.to change{order.my_order[selected]}.by -1
		end

		it 'will remove a dish from my_order' do
			order.add_to_order("oranges",4)
			expect{order.remove_from_order("oranges",4)}.to change{order.my_order.length}.by -1
		end

		it 'will fail if the dish is not in my_order' do
			expect{order.remove_from_order("banana",2)}.to raise_error "banana is not in your order."
		end
		
	end

end