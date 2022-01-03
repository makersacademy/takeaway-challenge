require 'menu'

describe Menu do

    subject(:menu) { described_class.new(dishes) }

    let(:dishes) do
        {
            noodles: 3.99,
            chicken: 5.00,
            beef: 6.99
        }
    end 

    it 'has a list of dishes with prices' do
        expect(menu.dishes).to eq(dishes)
    end 

    it 'prints a list of dishes with prices' do
        printed_menu = "Noodles £3.99, Chicken £5.00, Beef £6.99"
        expect(menu.print).to eq(printed_menu)
    end 

    it 'tells if a dish is on the menu' do
        expect(menu.has_dish?(:chicken)).to be true 
    end 

    it 'tells if a dish is not on the menu' do
        expect(menu.has_dish?(:pork)).to be false
    end 

    it 'calculates a price' do
        expect(menu.price(:chicken)).to eq(dishes[:chicken])
    end 
end