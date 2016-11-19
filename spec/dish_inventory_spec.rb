require 'dish_inventory'

describe DishInventory do

  let (:dish_inventory) {described_class.new}


  describe "Storing a list of dish objects" do

    it "should be initialized with an empty array of dishes" do
      expect(dish_inventory.dishes).to eq []
    end

    end

end
