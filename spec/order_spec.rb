require 'order'

describe Order do

	subject(:order) { described_class.new }

	it 'should be initialized with an empty basket' do
		expect(order.basket).to eq []
	end

	it { is_expected.to respond_to(:create_order) }


	# before do
	# 	STDIN = StringIO.new("2\n1\n\n")
	# end

	# after do
	# 	STDIN = STDIN
	# end

	# it 'is expected to add items to the basket' do
	# 	order.create_order
	# 	expect(order.basket).to eq ([{:number=>2, :item=>"Pepperoni Pizza", :cost=>"£6.99"}])
	# end


end