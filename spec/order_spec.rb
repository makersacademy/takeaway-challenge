require 'order'

describe Order do
subject(:order){described_class.new}

	describe '#calculate' do
		it 'should return total' do
		order.items = [{"Pepperoni Pizza" => 6.00},{"Pepperoni Pizza" => 6.00}]
		expect(order.price).to eq 12
		end
	end

end