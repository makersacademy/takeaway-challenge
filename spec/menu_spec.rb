require 'menu'

describe Menu do

  subject(:menu) { Menu.new }

  describe "#show" do

    it "should return a list of dishes with prices" do
      message = ["1. Big Mac: £3.19", "2. Quarter Pounder: £3.19", "3. McChicken: £3.00",
        "4. Cheeseburger: £0.99", "5. Hamburger: £0.89", "6. French Fries: £1.09"].join("\n")

      expect { menu.show }.to output(puts message).to_stdout
    end

  end

  describe "available?" do
    it "should return true for items on the menu" do
      expect(menu.available?("Big Mac")).to eq true
    end

    it "should return false for items not on the menu" do
      expect(menu.available?("Blah")).to eq false
    end
  end

end
