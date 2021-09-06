require "Order"
require "Menu"

describe Order do
    subject(:order) { described_class.new(menu) }
    
    let(:menu) { instance_double("Menu") }
    
    let(:dishes) do
        {
            Plaice: 4,
            Vegetable_Curry: 3,
        }
    end
    
    before do
        allow(menu).to receive(:has_dish?).with(:Plaice).and_return(true)
        allow(menu).to receive(:has_dish?).with(:Vegetable_Curry).and_return(true)
        allow(menu).to receive(:price).with(:Plaice).and_return(7.25)
        allow(menu).to receive(:price).with(:Vegetable_Curry).and_return(6.95)
    end
    
    it "selects multiple dishes from the menu" do
        create_order
        expect(order.dishes).to eq(dishes)
    end
    
    it "rejects dishes not on the menu" do
        allow(menu).to receive(:has_dish?).with(:cod).and_return(false)
        expect { order.add(:cod, 3) }.to raise_error NoItemError, "Cod is not on the menu!"
    end
    
    it "calculates order total" do
        create_order
        total = 49.85
        expect(order.total).to eq(total)
    end
    
        
    def create_order
        order.add(:Plaice, 4)
        order.add(:Vegetable_Curry, 3)
    end
    
end