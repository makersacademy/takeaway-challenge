require 'dish_inventory'

describe DishInventory do

  let (:dish_inventory) {described_class.new}
  let (:dish) {double :dish}
  let (:dish_name) {double :dish_name}
  let (:dish_price) {double :dish_price}


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
    it "when a dish has been ordered it should be removed from the inventory" do
      dish_inventory.add_dish(dish)
      dish_inventory.remove_dish(dish)
      expect(dish_inventory.dishes).not_to include dish
    end

    it "should raise an error if the dish is not avalaible in the inventory" do
      expect{dish_inventory.remove_dish(dish)}.to raise_error "Sorry this item is out of stock"
    end

  end

  # describe "displaying inventory" do
  #   it "should present its inventory with name and price of goods in its stock" do
  #     expect(dish_inventory.show_inventory).to include({name: dish_name, price: dish_price})
  #   end
  # end

end
