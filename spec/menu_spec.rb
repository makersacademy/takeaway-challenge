require "menu"

describe Menu do
  it "creates a menu class with two arguments" do
    expect(Menu).to respond_to(:new).with(2).arguments
  end

  describe "#initialize" do
    it "initalises menu with custom name and menu" do
      wagamama = Menu.new("Wagamama", [])
      expect(wagamama.name).to eq "Wagamama"
    end
  end

  describe "#view_menu" do
    it "allows customer to view the menu" do
      wagamama = Menu.new("Wagamama", [Dish.new("Vegan Yasai Cha Han", 13.99), Dish.new("Gyoza", 6.50)])
      expect { wagamama.view_menu }.to output("Vegan Yasai Cha Han...........£13.99\nGyoza.........................£6.50\n").to_stdout
    end
  end
end
