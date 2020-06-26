require 'menu'

describe Menu do
  describe "a menu is created" do
    it " creates a new menu with dishes" do
      menu = Menu.new
      expect(menu).to be_an_instance_of(Menu)
    end
  end
end