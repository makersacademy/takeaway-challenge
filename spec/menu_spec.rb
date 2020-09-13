require "menu"

describe Menu do
  let(:menu) {
    Menu.new("Mildreds", [Dish.new("Soul Bowl", 13.99),
                          Dish.new("Tofu Donburi", 13.50),
                          Dish.new("Buffalo Chick'n Burger", 10.00),
                          Dish.new("Gyoza", 6.50)])
  }

  it "creates a menu class with two arguments" do
    expect(Menu).to respond_to(:new).with(2).arguments
  end

  describe "#initialize" do
    it "initalises menu with custom name and menu" do
      wagamama = Menu.new("Wagamama", [])
      expect(wagamama.name).to eq "Wagamama"
    end
  end

  describe "#get_dish" do
    it "matchs menu items irrespective of capitalisation" do
      expect { menu.get_dish("TOFU DONBURI") }.not_to raise_error
    end
  end

  describe "#view_menu" do
    it "allows customer to view the menu" do
      expect { menu.view_menu }.to output("Welcome to Mildreds.................\nSoul Bowl.....................£13.99\nTofu Donburi..................£13.50\nBuffalo Chick'n Burger........£10.00\nGyoza.........................£6.50\n").to_stdout
    end
  end
end
