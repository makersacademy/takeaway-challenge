require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dishes) { Menu::MENU }

  describe '#dishes' do
    it 'has a list of dishes with prices' do
      expect(menu.dishes).to eq(dishes)
    end
  end

  describe '#print' do
    it 'prints a list of dishes with prices' do
      printed_menu = "Sashimi: £5, Tempura: £4, Uni: £4"
      expect(menu.print_menu).to eq(printed_menu)
    end
  end
end
