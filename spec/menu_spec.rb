require "./lib/dish"
require "./lib/menu"

describe Menu do

  context "Single dish" do
    subject {
      dishes = [Dish.new("Burger", 8)]
      Menu.new(dishes)
    }

    it "has single dish" do
      expect(subject.dishes[0].name).to eq ("Burger")
    end
  end

  context "Multiple dishes" do
    subject {
      dish_1 = Dish.new("Burger", 8)
      dish_2 = Dish.new("Pizza", 10)
      dish_3 = Dish.new("Pasta", 6)
      dishes = [dish_1, dish_2, dish_3]
      Menu.new(dishes)
    }

    it "has multiple dishes" do
      expect(subject.dishes[0].name).to eq ("Burger")
      expect(subject.dishes[1].name).to eq ("Pizza")
      expect(subject.dishes[2].name).to eq ("Pasta")
      expect(subject.dishes[0].price).to eq (8)
      expect(subject.dishes[1].price).to eq (10)
      expect(subject.dishes[2].price).to eq (6)
    end
  end



end