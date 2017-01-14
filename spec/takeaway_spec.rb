require 'takeaway'

describe Takeaway do
subject(:takeaway){described_class.new}

	describe '#list' do
		it 'should return a list of dishes' do
		expect(takeaway.list).to include ({"Pepperoni Pizza" => 6.00})
		end
	end

	describe '#order' do
		context 'should make a new order' do
			it 'return total of one item' do
			expect(takeaway.order("Pepperoni Pizza")).to eq 6
			end
			it 'return total of two different items' do
			takeaway.order("Pepperoni Pizza")
			expect(takeaway.order("American Hot Pizza")).to eq 12.5
			end
			it 'return total of two identical items' do
			expect(takeaway.order("Pepperoni Pizza", 2)).to eq 12
			end
		end
	end

	describe '#total' do
		it 'should return a total' do
		takeaway.order("Pepperoni Pizza", 2)
		expect(takeaway.total).to eq 12
		end
	end

end