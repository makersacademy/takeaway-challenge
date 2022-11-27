require 'dish'
require 'dish_list'

RSpec.describe "integration" do

  context "when dishes are added to the dish list" do
    it "returns full list" do
      dish_list = DishList.new
      dish_1 = Dish.new("pizza", 12.00)
      dish_2 = Dish.new("pasta", 12.00)
      dish_list.add(dish_1)
      dish_list.add(dish_2)
      result = dish_list.list
      expect(result).to eq [dish_1, dish_2]
    end
  end
  
  context "when dishes are selected" do
    it "returns list of selected dishes" do
      dish_list = DishList.new
      dish_1 = Dish.new("pizza", 12.00)
      dish_2 = Dish.new("pasta", 12.00)
      dish_3 = Dish.new("cake", 12.00)
      dish_list.add(dish_1)
      dish_list.add(dish_2)
      dish_list.add(dish_3)
      dish_1.selected
      dish_2.selected
      result = dish_list.selection
      expect(result).to eq [dish_1, dish_2]
    end
  end

  context "when dishes are selected and then deselected" do
    it "returns list of selected dishes" do
      dish_list = DishList.new
      dish_1 = Dish.new("pizza", 12.00)
      dish_2 = Dish.new("pasta", 12.00)
      dish_3 = Dish.new("cake", 12.00)
      dish_list.add(dish_1)
      dish_list.add(dish_2)
      dish_list.add(dish_3)
      dish_1.selected
      dish_2.selected
      dish_2.deselect
      dish_3.selected
      result = dish_list.selection
      expect(result).to eq [dish_1, dish_3]
    end
  end

  context "when dishes are selected" do
    it "returns grand total" do
      dish_list = DishList.new
      dish_1 = Dish.new("pizza", 12.00)
      dish_2 = Dish.new("pasta", 12.00)
      dish_3 = Dish.new("cake", 12.00)
      dish_list.add(dish_1)
      dish_list.add(dish_2)
      dish_list.add(dish_3)
      dish_1.selected
      dish_2.selected
      expect(dish_list.grand_total).to eq "Total cost: £24.00"
    end

    it "returns itemised receipt with grand total" do
      dish_list = DishList.new
      dish_1 = Dish.new("pizza", 12.00)
      dish_2 = Dish.new("pasta", 12.00)
      dish_3 = Dish.new("cake", 12.00)
      dish_list.add(dish_1)
      dish_list.add(dish_2)
      dish_list.add(dish_3)
      dish_1.selected
      dish_2.selected
      expect(dish_list.receipt).to eq ["pizza, £12.00", "pasta, £12.00", "Total cost: £24.00"]
    end
  end

end
