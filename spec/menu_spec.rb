require 'menu'

describe Menu do

  subject(:menu) { described_class.new(Menu::MENU)}

  describe '#show_menu' do
    it "prints the menu" do
      expect(menu.show).to eq Menu::MENU
    end
  end

  describe '#includes?' do
    it 'includes an item' do
      expect(menu.includes?("BANANA_BREAD")).to be_truthy
    end

    it 'does not include an item' do
      expect(menu.includes?("cereal")).to be_falsey
    end
  end

end
