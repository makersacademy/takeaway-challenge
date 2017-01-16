require 'menu'

describe Menu do
  subject(:menu){described_class.new}
  before :each do
    Menu.send(:remove_const, "FILENAME")
    Menu::FILENAME = "./lib/list_dishes_test.csv"
  end

  describe '#load_dishes' do
    it 'loads up-to-date dishes and prices' do
      expect(menu).to respond_to(:load_dishes)
    end

    it 'checks if all dishes are being loaded' do
      menu.load_dishes
      expect(menu.list.length).to eq(8)
    end
  end

  describe '#printer' do
    it 'can print menu' do
      expect(menu.printer).to eq(menu.list)
    end
  end
end
