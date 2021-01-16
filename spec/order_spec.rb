require 'order'
require 'menu'
describe Order do 
    subject(:order) {described_class.new(menu) }

    let(:menu) {double(:menu) }

    let(:dishes) do 
        {
            chicken: 2,
            fish: 1
        }
    end

    before do 
        allow(menu).to receive(:has_dish?).with(:chicken).and_return(true)
        allow(menu).to receive(:has_dish?).with(:fish).and_return(true)

        allow(menu).to receive(:price).with(:chicken).and_return(3.00)
        allow(menu).to receive(:price).with(:fish).and_return(2.50)
    end

    it "selects several dishes from the menu" do 
        order.add(:chicken, 2)
        order.add(:fish, 1)
        expect(order.dishes).to eq(dishes)
    end 

    it "doesnt allow items to be added that arent on the menu" do 
        allow(menu).to receive(:has_dish?).with(:beef).and_return(false)
        expect { order.add(:beef, 2)}.to raise_error NoItemError, "Beef is not on the menu"
    end 

    it "calculates the total order" do 
        order.add(:chicken, 2)
        order.add(:fish, 1)
        total = 8.50 
        expect(order.total).to eq(total)
    end 

end 