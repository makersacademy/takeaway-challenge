require "order"

describe Order do
	subject(:order) { described_class.new }

	let(:food_list) do
		{
			pizza: 1,
			Green_Shake: 2
		}
	end
	it "selects orders from the menu" do
		order.add(:pizza, 1)
		order.add(:Green_Shake, 2)
		expect(order.food_list).to eq(food_list)
	end
end
