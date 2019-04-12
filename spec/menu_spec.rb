require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  context '#viewing a list of dishes and prices' do
    it 'prints menu' do
      expect(menu.view_menu).to eq Menu::MAIN_MENU
    end
  end
end
