require "order"

describe Order do
	subject(:order) { described_class.new(menu) }

	let(:menu) { double(:menu) }
	let(:food_list) do
		{
			pizza: 1,
			Green_Shake: 2
		}
	end

	before do
		allow(menu).to receive(:has_item?).with(:pizza).and_return(true)
		allow(menu).to receive(:has_item?).with(:Green_Shake).and_return(true)
	end

	it "selects orders from the menu" do
		order.add(:pizza, 1)
		order.add(:Green_Shake, 2)
		expect(order.food_list).to eq(food_list)
	end

	it "prevents adding items that are not on the menu" do
		allow(menu).to receive(:has_item?).with(:chicken).and_return(false)
		expect{order.add(:chicken,1)}.to raise_error("Item is not on the menu")
	end


end
