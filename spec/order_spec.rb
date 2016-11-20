require 'order'

describe Order do

	subject(:order) { described_class.new }

	it 'should be initialized with an empty basket' do
		expect(order.basket).to eq []
	end

	describe '#add' do

		it 'expects items from the menu to be added to the basket' do
			order.add(1, 1)
			expect(order.basket).to eq [{:number=>1, :item=>"Cheese Pizza", :cost=>"£5.99"}]
		end

	end

	describe '#order_total' do

		it 'is expected to calculate the order total' do
			order.add(1, 2)
			expect(order.order_total).to eq 11.98
		end

	end

end