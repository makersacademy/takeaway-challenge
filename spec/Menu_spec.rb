require 'menu'

describe Menu do

  let(:price_list) do
    {
        lasagne: 8.99,
        pizza: 10.99,
        burger: 9.99

    }
  end

    describe '#price_list' do
      it 'shows a list of dishes with prices' do
        expect(subject.price_list).to eq(price_list)
      end
    end

    describe '#print_menu' do
      it 'prints the menu with prices' do
      printed_menu = 'Lasagne £8.99, Pizza £10.99, Burger £9.99'
          expect(subject.print_menu).to eq(printed_menu)
      end
    end

    describe '#price' do
      it 'prints the price of a dish' do
        expect(subject.price(:lasagne)).to eq(price_list[:lasagne])
      end
    end

    describe '#has_dish?' do
      it 'returns true if dish is on the menu' do
        expect(subject.has_dish?(:lasagne)).to eq(true)
      end
      it 'returns false if dish is not on the menu' do
        expect(subject.has_dish?(:chips)).to eq(false)
      end
    end
end
