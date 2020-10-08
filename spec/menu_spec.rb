require 'menu'

describe Menu do
  describe '#initialize' do
    it 'there is a menu with items' do
      expect(Menu::MENU).not_to be_empty
    end
  end
end
