require 'menu.rb'

describe Menu do

  describe '#to_s' do
    let(:menu_item1) { double :menu_item }
    let(:menu_item2) { double :menu_item }
    before do
      allow(menu_item1).to receive(:to_s).and_return("Malt Loaf Rarebit: £10")
      allow(menu_item2).to receive(:to_s).and_return("Alfio's Affogato: £8")
    end

    it 'show menu_items as a list' do
      rex_menu = Menu.new([menu_item1, menu_item2])
      expect(rex_menu.to_s).to eq "Malt Loaf Rarebit: £10\nAlfio's Affogato: £8"
    end
  end

end
