require 'menu'

describe Menu do
  subject(:menu) { described_class.new(dishes) }
  let(:dishes) do {
   margherita:                    4.00,
   capricciosa:                   4.50
  }
  end

  context 'list of dishes' do
    describe '#dishes' do
      it 'has a list of dishes and their prices' do
        expect(menu.dishes).to eq dishes
      end
    end

    describe '#show_menu' do
      it 'shows a list of dishes and their prices' do
        expect(menu.show_menu).to eq "Margherita £4.00, Capricciosa £4.50"
      end
    end
  end

  context 'dishes availabilty' do
    describe '#dish_available?' do
      it 'says whether a dish is available on the menu' do
        expect(menu.dish_available?(:margherita)).to be true
      end


      it 'says whether a dish is not available on the menu' do
        expect(menu.dish_available?(:curry)).to be false
      end
    end
  end

  context 'price of the dish' do
    describe '#price' do
      it 'returns the price of the dish' do
        expect(menu.price(:margherita)).to eq dishes[:margherita]
      end
    end
  end

end
