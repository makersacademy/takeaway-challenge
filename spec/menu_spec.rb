require 'menu'

describe Menu do

  describe '#display_menu' do
    it 'returns the list of dishes' do
      expect(subject.display_menu).to eq Menu::MENU_LIST
    end
  end

end
