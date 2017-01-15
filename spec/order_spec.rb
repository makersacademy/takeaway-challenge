require 'order'

describe Order do
subject(:order){described_class.new}

	describe '#price' do
		it 'should return total' do
		order.items = [{"Pepperoni Pizza" => 6.00},{"Pepperoni Pizza" => 6.00}]
		expect(order.price).to eq 12
		end
	end

	describe '#price' do
		it 'should return total' do
		pizza = {"Pepperoni Pizza" => 6.00}
		expect(order.list_summary(pizza, 2)[0]).to eq (" Pepperoni Pizza x 2 = £12.00 |")
		end
	end

end