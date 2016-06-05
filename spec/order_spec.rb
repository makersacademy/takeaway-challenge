require 'order'

describe Order do

	subject(:order) { described_class.new }

	let(:item) { double(:item) }
	let(:menu) { double(:menu, item_price: {"veggie" => 4.00}) }

	describe '#add' do

		it "adds item to order" do
			order.add(item, 2)
			expect(order.include?(item)).to eq true 
		end

	end

	describe '#order_total' do

		it "calculates the total price of the order" do
			order.add("veggie", 2)
			expect(order.order_total).to eq 8.00
		end
		
	end

end