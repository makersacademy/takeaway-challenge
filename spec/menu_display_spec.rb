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
      allow(menu).to receive(:menu).and_return({ lettuce: 0.5 })
      item_on_menu = :lettuce
      expect(MenuDisplay.new(menu).price_to_sterling(item_on_menu)).to eq '£0.5'
    end
  end

end
