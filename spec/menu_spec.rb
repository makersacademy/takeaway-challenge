require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#view' do
    it 'should list menu items and prices' do
      expect(menu.view).to eq Menu::MENU_ITEMS
    end
  end

  describe '#price' do
    it 'should return price of item' do
      expect(menu.price('Beef burger')).to eq 8.5
    end
  end

end
