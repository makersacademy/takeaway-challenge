require 'order'
require 'menu'

describe Order do
    subject(:order) { described_class.new(menu)}

    let (:menu) { instance_double("Menu") }

    let (:dishes) do
        {
            chicken: 2, 
            beef: 1
        }
    end 

    before do 
        allow(menu).to receive(:has_dish?).with(:chicken).and_return(true)
        allow(menu).to receive(:has_dish?).with(:beef).and_return(true)

        allow(menu).to receive(:price).with(:chicken).and_return(5.00)
        allow(menu).to receive(:price).with(:beef).and_return(6.99)
    end 


    it 'selects a number of dishes from the menu' do
        create_order
        expect(order.dishes).to eq(dishes)
    end 

    it 'does not allow items to be added that are not on the menu' do
        allow(menu).to receive(:has_dish?).with(:pork).and_return(false)
        expect { order.add(:pork, 2)}.to raise_error NoItemError, 'Pork is not on the menu'
    end 

    it 'calculates the total for the order' do
        create_order
        total = 16.99
        expect(order.total).to eq(total)
    end 

    def create_order
        order.add(:chicken, 2)
        order.add(:beef, 1)
    end 

end 