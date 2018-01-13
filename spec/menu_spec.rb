require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  describe "show menu" do
    it "prints the menu" do
      expect(menu.show).to eq Menu::MENU
    end
  end

end
