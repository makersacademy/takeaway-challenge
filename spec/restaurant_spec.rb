require 'restaurant'

describe Restaurant do
    
    subject(:restaurant)    { described_class.new(menu: menu, order: order) }
    
    let(:menu)              { double(:menu) }
    let(:order)             { double(:order) }
    
    it 'can show the user a menu' do
        printed_dishes = "Lamb Rogan Josh £9.25, Chicken Madras £8.95"
        allow(menu).to receive(:print_dishes).and_return(printed_dishes)
        expect(restaurant.show_menu).to eq(printed_dishes)
    end
    
    it 'can take an order for a quantity of dishes and return a total' do
        total = "Your order total is: £27.15"
        user_order = "Lamb Rogan Josh 1, Chicken Madras 2"
        allow(order).to receive(:add).with(user_order)
        allow(order).to receive(:total).and_return(total)
        expect(restaurant.take_order(user_order)).to eq(total)
    end
end
