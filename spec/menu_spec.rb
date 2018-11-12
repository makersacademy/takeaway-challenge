require 'menu'

describe Menu do

  let(:menu) { described_class.new }

  describe '#display_menu' do
    it 'displays the menu' do
      expect(menu.display_menu).to eq Menu::DISH_LIST
    end
  end

end
