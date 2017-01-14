require 'restaurant'

describe Restaurant do
    
    subject(:restaurant)    { described_class.new(menu: menu) }
    
    let(:menu)              { double(:menu) }
    
    it 'can show the user a menu' do
        printed_dishes = "Lamb Rogan Josh £9.25, Chicken Madras £8.95"
        allow(menu).to receive(:print_dishes).and_return(printed_dishes)
        expect(restaurant.show_menu).to eq(printed_dishes)
    end
end
