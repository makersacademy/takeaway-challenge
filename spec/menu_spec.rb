require 'menu'

describe Menu do
  subject(:menu) { Menu.new }

  describe '#initialize' do
    it 'there is a menu with items' do
      expect(menu.items).not_to be_empty
    end
  end
end
