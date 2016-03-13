require 'menu'

describe Menu do

  describe "#viewmenu" do
    it "customer can view menu" do
      menu = Menu.new
      expect(menu.show_menu).to eq ({ "Chicken" => 5, "Lamb" => 8, "Chips" => 2 })
    end
  end

end