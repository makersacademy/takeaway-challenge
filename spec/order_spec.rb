require 'order'

describe Order do

	subject(:order) { described_class.new }

	it 'should be initialized with an empty basket' do
		expect(order.basket).to eq []
	end

	it { is_expected.to respond_to(:select_items) }

end