require 'menu'
describe Menu do
    
    let(:menu) { Menu.new(dishes)}
    let(:dishes) do
        {
            chicken: 3.00,
            fish: 4.00
        }
    end

    it 'has a list of dishes with prices' do
        expect(menu.dishes).to eq(dishes)
    end

    it 'prints a list of dishes' do
        printed_menu = 'Chicken £3.00, Fish £4.00'
        expect(menu.print).to eq(printed_menu)
    end

    it 'tells if a dish is on the menu' do
        expect(menu.has_dish?(:chicken)).to be true
    end

    it 'calculates a price' do
        expect(menu.price(:chicken)).to eq(dishes[:chicken])
    end

end