require 'menu'

describe Menu do
  describe '#initialize' do
    it "initializes with an empty basket" do
      expect(subject.basket).to be_empty
    end
  end
  describe '#print_menu' do
    it "prints a list of options and prices" do
      expect(subject.print_menu).to eq(Menu::MENU_LIST)
    end
  end
end
