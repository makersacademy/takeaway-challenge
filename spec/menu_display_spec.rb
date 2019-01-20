require 'menu_display'

describe MenuDisplay do
  let(:menu) { double 'menu' }

  it { is_expected.to respond_to(:list_menu).with(0).arguments }

  describe '#list_menu' do
    it 'lists the menu in pleasant format' do
      allow(menu).to receive(:menu).and_return(Menu::DEFAULT_MENU)
      expect(MenuDisplay.new(menu).list_menu).to eq "Chips: £1\nLentil Stew: £3\nUncooked Pasta: £2"
    end
  end

  describe '#price_to_sterling' do
    it 'converts price to £' do
      allow(menu).to receive(:menu)
      price = 0.5
      expect(MenuDisplay.new(menu).price_to_sterling(price)).to eq '£0.5'
    end
  end

  describe '#print_item' do
    it 'prints item capitalized' do
      allow(menu).to receive(:menu).and_return({ lentil_stew: 20 })
      item_on_menu = :lentil_stew
      expect(MenuDisplay.new(menu).print_item(item_on_menu)).to eq 'Lentil Stew'
    end
  end

end
