require 'menu.rb'

describe Menu do

  describe "#see_menu" do
    it "shows me the menu options and their prices" do
      menu = Menu.new
      expect(menu.see_menu).to eq(@menu)
    end
  end

end
