require 'order'
require 'menu'

describe Order do 
    subject(:order) { described_class.new(menu) }

    let(:menu) { instance_double("Menu") }

    let(:dishes) do
        {
            pizza: 2,
            haggis: 1
        }
    end

    before do 
        allow(menu).to receive(:has_dish?).with(:pizza).and_return(true)
        allow(menu).to receive(:has_dish?).with(:haggis).and_return(true)
    end
 
    it "selects several dishes from the menu" do
        order.add(:pizza, 2)
        order.add(:haggis, 1)
        expect(order.dishes).to eq(dishes)
    end

    it "doesn't allow items to be added that are not on the menu" do
        allow(menu).to receive(:has_dish?).with(:ramen).and_return(false)
        expect { order.add(:ramen, 1) }.to raise_error NoItemError, "Ramen is not on the menu."
    end
end