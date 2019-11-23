require "menu"

describe Menu do

  let(:menu)   { Menu.new }
  let(:dish_1) { double :dish, name: "Carbonara", price: 10 }
  let(:dish_2) { double :dish, name: "Puttanesca", price: 12 }

  describe "#list" do

    it "returns an empty string if there are no dishes in the menu" do
      expect(menu.list).to eq ""
    end

    it "returns the list of dishes" do
      menu.add(dish_1)
      menu.add(dish_2)
      expect(menu.list).to eq "Dish 1: Carbonara, £10\nDish 2: Puttanesca, £12"
    end

  end

  describe "#add" do

    it "raises an error if the dish is already in the menu" do
      menu.add(dish_1)
      expect { menu.add(dish_1) }.to raise_error "This dish is already in the menu"
    end

  end

end
