require 'menu'

describe Menu do

  describe '#display_menu' do
    it 'displays the menu' do
      expect(subject.display_menu).to eq Menu::DISH_LIST
    end
  end

end
