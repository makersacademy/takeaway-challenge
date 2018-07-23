require './lib/menu'

describe Menu do

  #It responds to display
    it "responds to display" do
      expect(subject).to respond_to(:display_menu)
    end
    #Checks that the menu items actually exist
    it "checks that the menu items exist" do
      subject{ Menu.new }
      expect(Menu::CHINESE_MENU).to include({
        "Chicken with lemon sauce" => 4.00,
        "Chinese Roasted Pork"     => 4.00,
        "Roasted Duck"             => 8.00
      })
    end
end
