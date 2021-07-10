require 'order'

describe Order do
	subject(:order) { described_class.new }

	let(:dishes) do
	{
		egg_fried_rice: 2
	}
	end

	it "add passes each dish and its quantity as args to order, whose output hash then contains the selected dishes/quantities" do 
		order.add(:egg_fried_rice, 2)
		expect(subject.dishes).to eq(dishes)
    end
end
