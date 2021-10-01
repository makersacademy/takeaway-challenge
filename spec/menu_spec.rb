require "menu"

RSpec.describe Menu do
  let(:menu) { Menu.new }
  describe "view" do
    it "shows the restaurant's menu" do
      expect(menu.view).to eq Menu::MENU
    end
  end
end
