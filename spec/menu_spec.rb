require "menu"

describe Menu do
  
  describe "initialize" do
    it "creates an instance of a menu" do
      menu = Menu.new("Sushi", 4)
      expect(menu).to be_an_instance_of(Menu)
    end
    it "stores names and prices of dishes in an hash" do
      menu = Menu.new("Sushi", 4)
      expect(menu.dishes).to be_an_instance_of(Hash)
    end
  end
  
end
