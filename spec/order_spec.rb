require 'order'
require 'list'

describe Order do 
	subject(:order) { described_class.new(list) }

	let(:list) {instance_double("List") }

	let(:dishes) do
		{
			chicken_tandoori: 2,
			lamb_handi: 1
		}
	end

	before do
		allow(list).to receive(:has_dish?).with(:chicken_tandoori).and_return(true)
		allow(list).to receive(:has_dish?).with(:lamb_handi).and_return(true)
	end


	it "allows you to choose the quantity of several dishes" do
		order.add(:chicken_tandoori, 2)
		order.add(:lamb_handi, 1)
		expect(order.dishes).to eq(dishes)
	end

	it "it does not allow you to select dishes which are not on the list" do 
		allow(list).to receive(:has_dish?).with(:vindaloo).and_return(false)
		expect { order.add(:vindaloo, 2) }.to raise_error NoItemError, "Vindaloo is not on the list!"
	end

end