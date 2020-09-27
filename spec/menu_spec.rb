require 'menu'

describe Menu do
  subject(:menu) { Menu.new(dishes) }
  let(:dishes) do { egg_fried_rice: 2 }
    end
  
  describe "a menu is created" do
    it " creates a new menu with dishes" do
      expect(subject).to be_an_instance_of(Menu)
    end
  end

  describe "print the menu" do
    it "prints out the menu for the customer" do
      expect(menu.print).to eq(dishes)
    end
  end
end