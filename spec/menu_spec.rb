require 'menu'

describe Menu do

    subject(:menu) { described_class.new(dishes) }

    let(:dishes) do
        {
          beef: 3.99,
          fish: 4.50,
          sausage: 1.99
        }
    end

    it 'contain a list of dishes with prices' do
        expect(menu.dishes).to eq(dishes) 
    end

    it 'shows a list of dishes with prices' do
        printed_menu = "Beef £3.99, Fish £4.50, Sausage £1.99"
        expect(menu.print).to eq(printed_menu)
    end
    
end