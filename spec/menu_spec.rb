require 'menu'

describe Menu do

  describe '#show_menu' do
  
    it 'to be able to show menu items' do
      expect(subject.show_menu).to eq Menu::MENU_ITEMS
    end

  end

end
