require 'takeaway'

describe Takeaway do

	subject(:takeaway) { described_class.new(checkout_klass, order_klass) }
	let(:checkout_klass) { double(:checkout_klass, new: checkout) }
	let(:checkout) { double(:checkout) }
	let(:order_klass) { double(:order_klass, new: order) }
	let(:order) { double(:order) }

	describe '#place_order' do

		it { is_expected.to respond_to(:place_order).with(2).arguments }

		it 'should add items to the order' do
			expect(order).to receive(:add).with(1, 1)
			takeaway.place_order(1, 1)
		end

	end

end