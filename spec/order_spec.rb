require 'order'

describe Order do

	subject(:order) { described_class.new }

	let(:item) { double(:item) }
	let(:qty) { double(:qty) }

	describe '#add' do

		it "adds item to order" do
			order.add(item, qty)
			expect(order.include?(item)).to eq true 
		end

	end

end