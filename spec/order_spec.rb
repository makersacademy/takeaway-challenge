require 'order'

describe Order do

	subject(:order) { described_class.new }

	it 'should be initialized with an empty basket' do
		expect(order.basket).to eq []
	end

	it { is_expected.to respond_to(:create_order) }

	describe '#create_order' do

		before do
			$stdin = StringIO.new("2\n1\n\n")
		end

		after do
			$stdin = STDIN
		end

		it 'is expected to add items to the basket' do
			order.create_order
			expect(order.basket).to eq ([{:number=>2, :item=>"Pepperoni Pizza", :cost=>"£6.99"}])
		end

		it 'is expected to give the order total' do
			expect(order.create_order).to eq "£6.99"
		end

	end

end