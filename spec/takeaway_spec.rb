require 'takeaway'

describe Takeaway do

	subject(:takeaway) { described_class.new(order_klass) }
	let(:order) { double(:order) }
	let(:order_klass) { double(:order_klass, new: order) }


	it { is_expected.to respond_to(:place_order) }

	it { is_expected.to respond_to(:view_menu) }

	describe '#place_order' do

		it 'should create a new order' do
			allow(order).to receive(:create_order)
			expect(takeaway.place_order).to eq order.create_order
		end

	end

end