require 'order'

describe Order do
	subject(:order) { described_class.new(menu) }
	

	let(:menu) { double(:menu) }

	let(:dishes) do 
	{
		egg_fried_rice: 2
	}
	end

	before do 
		allow(menu).to receive(:has_dish?).with(:egg_fried_rice).and_return(true)
		allow(menu).to receive(:has_dish?).with(:shrimp_fu_yung).and_return(true)
	end

	it "add passes dish and quantity as args to order, equalling a hash of selected dish/quantities" do 
		order.add(:egg_fried_rice, 2)
		expect(subject.dishes).to eq(dishes)
	end

	it "add is passed a dish not on menu invoking a fail expecting add to break from adding said dish to order"  do
		allow(menu).to receive(:has_dish?).with(:shark).and_return(false)
		expect { subject.add(:shark, 2).to not_respond_to raise_error NoItemError, "Shark" }
	end
end
