require 'order'

describe Order do
    subject(:order) { described_class.new(menu)}

    let (:menu) { double(:menu) }

    let (:dishes) do
        {
            chicken: 2, 
            beef: 1
        }
    end 

    before do 
        allow(menu).to receive(:has_dish?).with(:chicken).and_return(true)
        allow(menu).to receive(:has_dish?).with(:beef).and_return(true)
    end 


    it 'selects a number of dishes from the menu' do
        order.add(:chicken, 2)
        order.add(:beef, 1)
        expect(order.dishes).to eq(dishes)
    end 

    it 'does not allow items to be added that are not on the menu' do
        allow(menu).to receive(:has_dish?).with(:pork).and_return(false)
        expect { order.add(:pork, 2)}.to raise_error NoItemError, 'Pork is not on the menu'
    end 



end 