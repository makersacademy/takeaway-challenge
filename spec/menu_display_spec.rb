require 'menu_display'

describe MenuDisplay do
  let(:menu) { double 'menu' }
  let(:menudisplay) { MenuDisplay.new }

  describe '#list_menu' do
    it 'lists the menu in pleasant format' do
      allow(menu).to receive(:hash).and_return(Menu::DEFAULT_MENU)
      expect(menudisplay.list_menu(hash: menu.hash)).to eq "#1. Chips £1\n#2. Lentil Stew £3\n#3. Uncooked Pasta £2"
    end
  end

  describe '#price_to_sterling' do
    it 'converts price to £' do
      price = 0.5
      expect(subject.price_to_sterling(price)).to eq '£0.5'
    end
  end

  describe '#print_item' do
    it 'prints item capitalized' do
      item_on_menu = :lentil_stew
      expect(menudisplay.print_item(item_on_menu)).to eq 'Lentil Stew'
    end
  end

end
