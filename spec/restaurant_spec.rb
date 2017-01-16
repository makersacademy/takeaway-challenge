require 'restaurant'

describe Restaurant do
    
    subject(:restaurant)    { described_class.new(menu: menu, order: order, text_message: text_message) }
    
    let(:menu)              { double(:menu) }
    let(:order)             { double(:order) }
    let(:text_message)      { double(:text_message, send: nil) }
    let(:user_order)        { "Lamb Rogan Josh 1, Chicken Madras 2" }
    let(:total)             { "Your order total is: £27.15" }
    
    before do
        allow(order).to receive(:add).with(user_order)
        allow(order).to receive(:total).and_return(total)
    end
    
    it 'can show the user a menu' do
        printed_dishes = "Lamb Rogan Josh £9.25, Chicken Madras £8.95"
        allow(menu).to receive(:print_dishes).and_return(printed_dishes)
        expect(restaurant.show_menu).to eq(printed_dishes)
    end
    
    it 'can take an order for a quantity of dishes and return a total' do
        expect(restaurant.take_order(user_order)).to eq(total)
    end
    
    it 'sends a confirmation text with a time when the order has been placed' do
        expect(text_message).to receive(:send)
        restaurant.take_order(user_order)
    end
end
