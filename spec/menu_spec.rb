require 'menu'
describe Menu do

  subject(:menu) { Menu.new(dishes) }

  let(:dishes) do
    {
      pasta: 1.99,
      pizza: 4.00
    }
  end

  describe '#defaults' do

    it { is_expected.to respond_to(:print_dishes) }

    context 'no dishes were given' do
      it 'has a default menu' do
        default_menu = described_class.new
        expect(default_menu.dishes).to eq described_class::MENU_ITEMS
      end
    end
  end

  describe '#print_dishes' do

    it 'prints a list of dishes with its price' do
      printed_dishes = "Pasta £1.99, Pizza £4.00"
      expect(menu.print_dishes).to eq printed_dishes
    end
  end

  describe '#on_menu?' do

    it 'returns true if there is an item on the menu' do
      expect(menu.on_menu?(:pasta)).to be true
    end

    it 'returns false if an item is not on the menu' do
      expect(menu.on_menu?(:steak)).to be false
    end
  end

  describe '#price' do
    it 'returns its price' do
      expect(menu.price(:pizza)).to eq 4.00
    end
  end
end
