require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  describe '#MENU_ITEMS' do

    it 'has a list of dishes and prices' do
      expect(menu.view_menu).to eq Menu::MENU_ITEMS
    end
  end
end
