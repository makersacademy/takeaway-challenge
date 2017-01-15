require "menu"

describe Menu do

  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      dumplings: 5.00,
      soup: 3.50
    }
  end

  context 'on initialization' do
    describe '#dishes' do
      it 'contains a list of dishes with prices' do
        expect(menu.dishes).to eq(dishes)
      end
    end
  end

  describe '#print_menu' do
    it 'prints a list of dishes with prices' do
      printed_menu = "Dumplings £5.00, Soup £3.50"
      expect(menu.print_menu).to eq(printed_menu)
    end
  end

end
