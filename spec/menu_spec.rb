require 'menu'

describe Menu do

  subject (:menu) {described_class.new}
  let (:dish) {double :dish}
  let (:dish1) {double :dish1}
  let (:dish2) {double :dish2}



  context "Inventory starts empty" do

    it "should raise an error if the inventory is empty" do
      expect{menu.remove_dish(dish)}.to raise_error "Sorry the inventory is empty"
    end

    it "should raise an error if the dish is not avalaible in the inventory" do
      menu.add_dish(dish)
      expect{menu.remove_dish(dish1)}.to raise_error "Sorry this item is out of stock"
    end

  end


  describe "Storing a list of dish objects" do

    it "should be initialized with an empty array of dishes" do
      expect(menu.dishes).to eq []
    end

    end

  describe "Adding a dish to the inventory" do

    it "adding a dish to the dish inventory stores it in the dishes variable" do
      menu.add_dish(dish)
      expect(menu.dishes).to include dish
    end

  end


  describe "removing a dish from the inventory" do

    context "Inventory has three dishes" do

      before do
        menu.add_dish(dish)
        menu.add_dish(dish1)
        menu.add_dish(dish2)
      end

      it "when a dish has been ordered it should be removed from the inventory" do
        menu.remove_dish(dish1)
        expect(menu.dishes).not_to include dish1
      end

      it "removing a dish returns the same dish from the dishes array" do
        expect(menu.remove_dish(dish1)).to eq dish1
      end

    end

  end

end
