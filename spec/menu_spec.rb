require 'menu'

describe Menu do

  subject(:menu) {described_class.new}

  describe '#view_menu' do

    it 'returns an hash containing menu items & prices' do
      menu.add_items({chips: 2, fish: 4})
      expect(menu.view_menu).to eq ({chips: 2, fish: 4})
    end
  end

  describe '#add_items' do
    it 'adds the passed array onto the exiting menu array' do
      menu.add_items({chips: 2, fish: 4})
      menu.add_items({beans: 1, burger: 4})
      expect(menu.view_menu).to eq ({chips: 2, fish: 4, beans: 1, burger: 4})

    end
  end
end
