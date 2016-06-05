require 'order'

describe Order do

	subject(:order) { described_class.new }

	let(:item) { double(:item) }

	describe '#add' do

		it "adds item to order" do
			order.add(item, 2)
			expect(order.include?(item)).to eq true 
		end

	end

end