require 'menu'

describe Menu do

  let(:menu) { Menu.new }

  describe ".new dishes" do
    it "equals an empty hash" do
      expect(menu.dishes).to eq([])
    end
  end

  describe "#add_dish" do
    it "adds a dish to dish_name" do
      new_dish = "Salmon"
      menu.add_dish(new_dish)
      expect(menu.add_dish(new_dish)).to eq(new_dish)
    end
  end

  describe "#add_price" do
    it "adds a price to dish_price" do
      dish_price = 15
      menu.add_price(dish_price)
      expect(menu.add_price(dish_price)).to eq(dish_price)
    end
  end
end
