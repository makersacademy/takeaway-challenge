require 'menu'

describe Menu do
   
  describe ".display_menu" do
    it "should return the menu" do
      expect(subject.display_menu).to eq "Vegan Burger" => 15,
        "Ealing + Chips" => 15,
        "Honest + Chips" => 14,
        "Tribute + Chips" => 14,
        "Guinness Fondue + Chips" => 15,
        "Beef + Mature Cheddar + Chips" => 13,
        "Chicken + Chips" => 13
    end

  end

  describe ".price" do
    it "should return the price of the selected dish" do
      expect(subject.price("Vegan Burger")).to eq "£15"
    end

  end
  
end
