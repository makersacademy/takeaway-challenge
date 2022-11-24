require 'dish_list'

RSpec.describe DishList do

  context "initially" do
    it "returns empty list" do
      dish_list = DishList.new
      expect(dish_list.list).to eq []
    end

    it "returns empty selection" do
      dish_list = DishList.new
      expect(dish_list.selection).to eq []
    end
  end

  context "creates a double for dish" do
    it "returns fake list" do
      dish_list = DishList.new
      dish_1 = double :fake_dish
      dish_2 = double :fake_dish
      dish_list.add(dish_1)
      dish_list.add(dish_2)
      expect(dish_list.list).to eq [dish_1, dish_2]
    end
  
    it "returns fake selection" do
      dish_list = DishList.new
      dish_1 = double :dish, is_selected?: true
      dish_2 = double :dish, is_selected?: true
      dish_3 = double :dish, is_selected?: false
      dish_list.add(dish_1)
      dish_list.add(dish_2)
      dish_list.add(dish_3)
      result = dish_list.selection
      expect(result).to eq [dish_1, dish_2]
    end

    it "returns fake receipt" do
      dish_list = DishList.new
      dish_1 = double :dish, is_selected?: true, format: "pizza, £12.00", price: 12.00
      dish_2 = double :dish, is_selected?: true, format: "pasta, £12.00", price: 12.00
      dish_list.add(dish_1)
      dish_list.add(dish_2)
      result = dish_list.receipt
      expect(result).to eq ["pizza, £12.00", "pasta, £12.00", "Total cost: £24.00"]
    end

    it "returns grand total as string" do
      dish_list = DishList.new
      dish_1 = double :dish, is_selected?: true, price: 12.00
      dish_2 = double :dish, is_selected?: true, price: 12.00
      dish_list.add(dish_1)
      dish_list.add(dish_2)
      result = dish_list.grand_total
      expect(result).to eq "Total cost: £24.00"
    end
  end
end
