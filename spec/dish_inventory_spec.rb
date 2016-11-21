require 'dish_inventory'

describe DishInventory do

  subject (:dish_inventory) {described_class.new}
  let (:dish) {double :dish}
  let (:dish1) {double :dish1}
  let (:dish2) {double :dish2}


  describe "Storing a list of dish objects" do

    it "should be initialized with an empty array of dishes" do
      expect(dish_inventory.dishes).to eq []
    end

    end

  describe "Adding a dish to the inventory" do

    it "adding a dish to the dish inventory stores it in the dishes variable" do
      dish_inventory.add_dish(dish)
      expect(dish_inventory.dishes).to include dish
    end

  end

  describe "removing a dish from the inventory" do



    context "Inventory has three dishes" do

      before do
        dish_inventory.add_dish(dish)
        dish_inventory.add_dish(dish1)
        dish_inventory.add_dish(dish2)
      end

      it "when a dish has been ordered it should be removed from the inventory" do

        dish_inventory.remove_dish(dish1)
        expect(dish_inventory.dishes).not_to include dish1
      end

      it "removing a dish returns the same dish from the dishes array" do
        expect(dish_inventory.remove_dish(dish1)).to eq dish1
      end

    end

    context "Inventory starts empty" do

      it "should raise an error if the inventory is empty" do
        expect{dish_inventory.remove_dish(dish)}.to raise_error "Sorry the inventory is empty"
      end

      it "should raise an error if the dish is not avalaible in the inventory" do
        dish_inventory.add_dish(dish)
        expect{dish_inventory.remove_dish(dish1)}.to raise_error "Sorry this item is out of stock"
      end

    end

  end

end
