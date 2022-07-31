require 'order'

describe Order do
    subject(:order) { described_class.new(menu) }

    let(:menu) {double(:menu)}

    let(:dishes) do{

        fish: 2,
        chips: 2
    }

    it "selects several dishes from the menu" do
        order.add(:fish, 2)
        order.add(:chips, 2)
        expect(order.dishes).to eq(dishes)
    end 

    it "doesnt allow orders for items not on menu" do
        expect { order.add(beef, 2)}.to raise_error "Beef is not on the menu"
    end 
end 
end 