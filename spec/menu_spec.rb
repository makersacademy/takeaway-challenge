require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#view' do
    it 'should list menu items and prices' do
      expect(menu.view).to eq Menu::MENU_ITEMS
    end
  end

end
