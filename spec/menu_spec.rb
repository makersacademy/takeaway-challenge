require './docs/menu'

describe Menu do
  let(:menu) { described_class.new }

  describe '#initialize' do
    it 'should have a list of 5 menu items' do
      expect(menu.menu_items.length).to eq 5
    end
  end

  describe '#show_menu' do
    it 'should print the menu items' do
      menu.show_menu
      menu_items = [
        "Haddock - £5",
        "Cod - £6",
        "Chips - £3",
        "Curry Sauce - £1",
        "Scraps - £1"
        ]
        expect(menu.show_menu).to eq menu_items
    end
  end

end
