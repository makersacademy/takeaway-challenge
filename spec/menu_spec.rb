require "menu"

describe Menu do

    subject(:menu) { described_class.new(dishes) }

    let(:dishes) do
        {
            burger: 10.99,
            vege: 9.99
        }
    end

    it 'has a list of dishes with prices' do
        expect(menu.dishes).to eq(dishes)
    end

    it 'prints a list of dishes and prices' do
        menu_output = "Burger £10.99, Vege £9.99"
        expect(menu.print).to eq(menu_output)
    end

end
