require 'takeaway'
require 'menu'

describe Takeaway do
  describe '#view_menu' do
    it 'should provide a list of dishes' do
      menu = Menu.new
      shop = described_class.new(menu)
      expect(shop.view_menu).to eq menu.items
    end
  end
  describe '#order' do
    xit 'should add a total from selected menu items' do
      menu = Menu.new
      shop = described_class.new(menu)
    end
  end
end
