require "order"

describe Order do
    subject(:order) { described_class.new(menu) }

    let(:menu) { instance_double("Menu") }
    let(:dishes) do
        {
            chicken: 2,
            beef: 1
        }
    end

    before do
       allow(menu).to receive(:has_dish?).with(:chicken).and_return(true)
       allow(menu).to receive(:has_dish?).with(:beef).and_return(true)
    end

    it "selects several dishes from the menu" do
        order.add(:chicken, 2)
        order.add(:beef, 1)
        expect(order.dishes).to eq(dishes)
    end

    it "doesn't allow items to be added that are not on the menu" do
      allow(menu).to receive(:has_dish?).with(:prawns).and_return(false)
       expect{ order.add(:prawns, 5) }.to raise_error NoItemError, "Prawns are not available"
    end
end 