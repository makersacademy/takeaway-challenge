require "./lib/dish"
require "./lib/menu"

describe Menu do

  context "Single dish" do
    subject do
      dishes = [Dish.new("Burger", 8)]
      Menu.new(dishes)
    end

    it "has single dish" do
      expect(subject.dishes[0].name).to eq ("Burger")
    end
  end

  context "Multiple dishes" do
    subject do
      dish_1 = Dish.new("Burger", 8)
      dish_2 = Dish.new("Pizza", 10)
      dish_3 = Dish.new("Pasta", 6)
      dishes = [dish_1, dish_2, dish_3]
      Menu.new(dishes)
    end

    it "has multiple dishes" do
      dish_1 = Dish.new("Burger", 8)
      dish_2 = Dish.new("Pizza", 10)
      dish_3 = Dish.new("Pasta", 6)
      dishes = [dish_1, dish_2, dish_3]
      expect(subject.dishes).to match_array dishes
    end
  end

end