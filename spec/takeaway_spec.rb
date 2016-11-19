require 'takeaway'

describe Takeaway do

	subject(:takeaway) { described_class.new(order_klass) }
	let(:order) { double(:order) }
	let(:order_klass) { double(:order_klass, new: order) }


	it { is_expected.to respond_to(:new_order) }

	it { is_expected.to respond_to(:view_menu) }

	describe '#new_order' do

		it 'should create a new order' do
			expect(takeaway.new_order).to eq order
		end

	end

end