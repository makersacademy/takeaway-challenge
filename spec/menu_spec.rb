require 'menu'

describe Menu do
   
  describe ".menu_card" do
    def with_captured_stdout
      original_stdout = $stdout
      $stdout = StringIO.new
      yield
      $stdout.string   
    ensure
      $stdout = original_stdout
    end
    it "should return the menu" do
      menu = Menu.new
      str = with_captured_stdout { menu.display_menu_card }
      expect(str).to eq "1. Vegan Burger, 15\n2. Ealing + Chips, 15\n3. Honest + Chips, 14\n4. Tribute + Chips, 14\n5. Guinness Fondue + Chips, 15\n6. Beef + Mature Cheddar + Chips, 13\n7. Chicken + Chips, 13\n"
    end
    
  end

end
