require 'menu'

describe Menu do

  describe '#defaults' do
    it { is_expected.to respond_to(:print_dishes)}

    context 'no dishes were given'
      it 'has a default menu' do
        default_menu = described_class.new
        expect(default_menu.dishes).to eq described_class::MENU_ITEMS
      end
    end

  end

  describe '#print_dishes' do
    subject(:menu) { Menu.new(dishes) }

    let(:dishes) do
      {
        pasta: 1.99,
        pizza: 4.00
      }
    end
    
    it 'prints a list of dishes with its price' do
      printed_dishes = "Pasta £1.99, Pizza £4.00"
      expect(menu.print_dishes).to eq printed_dishes
    end

end
