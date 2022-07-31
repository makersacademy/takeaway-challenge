require 'menu'

describe Menu do 
    subject(:menu) { described_class.new(dishes) }

    let(:dishes) do 
        {
            burger: 5,
            pizza: 4,
            haggis: 3
        }
    end

    it 'has a list of dishes with prices' do
        expect(menu.dishes).to eq(dishes)
    end

    it 'prints a list of dishes with prices' do
        printed_menu = "Burger: £5, Pizza: £4, Haggis: £3"
        expect(menu.print).to eq(printed_menu)
    end

    it 'tells if a dish is on the menu' do 
        expect(menu.has_dish?(:haggis)).to be true
    end

    it 'tells if a dish is not on the menu' do 
        expect(menu.has_dish?(:ramen)).to be false
    end
end