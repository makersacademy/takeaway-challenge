require 'menu'

describe Menu do
  subject(:menu){described_class.new}
  before :each do
    Menu.send(:remove_const, "FILENAME")
    Menu::FILENAME = "./lib/list_dishes_test.csv"
  end

  describe '#printer' do
    it 'can print menu' do
      expect(menu.printer).to eq(menu.list)
    end
  end
end
