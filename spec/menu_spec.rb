require "menu"

describe Menu do
  let(:menu)   { Menu.new }
  let(:dish_1) { double :dish, name: "Carbonara", price: 10 }
  let(:dish_2) { double :dish, name: "Puttanesca", price: 12 }

  describe "#add" do
    it "should return a confirmation message that the dish has been added to the menu" do
      expect(menu.add(dish_1)).to eq "Carbonara added to the menu"
    end

    it "should raise an error if the dish is already in the menu" do
      menu.add(dish_1)
      expect { menu.add(dish_1) }.to raise_error "This dish is already in the menu"
    end
  end

  describe "#list" do
    it "should return an empty string if there are no dishes in the menu" do
      expect(menu.list).to eq ""
    end

    it "should return the list of dishes" do
      menu.add(dish_1)
      menu.add(dish_2)
      expect(menu.list).to eq "Carbonara (£10), Puttanesca (£12)"
    end
  end

  describe "#contains?" do
    it "should return true if the dish is in the menu" do
      menu.add(dish_1)
      expect(menu.contains?(dish_1)).to eq true
    end

    it "should return false if the dish is not in the menu" do
      expect(menu.contains?(dish_1)).to eq false
    end
  end
end
