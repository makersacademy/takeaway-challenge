require 'restaurant'

describe Restaurant do

  subject(:restaurant) { described_class.new}
  let (:menu) {{"Burger" => 2.50,
                "Wings" => 3.00,
                "Meal" => 4.00,
                "Shake" => 2.50}}

  let (:item) {double :dish}

    it "initializes with an empty basket" do
        expect(subject.basket).to be_empty
    end

  describe "#print_menu" do
    it "shows the menu of available dishes" do
      expect(restaurant.print_menu).to include({"Wings" => 3.00})
    end
  end

  describe "#add_to_order" do
    it "add_to_order method has 1 argument" do
      expect(restaurant).to respond_to(:add_order).with(2).arguments
    end

    it "adds a specific dish to the basket" do
      restaurant.add_order("Burger")
      expect(restaurant.basket).to include("Burger")
    end

    it "it gives a default quantity of 1" do
      restaurant.add_order("Burger")
      expect(restaurant.basket["Burger"]).to eq(1)
    end

    it "allows other quanitities to be specified when ordering" do
      restaurant.add_order("Burger", 3)
      expect(restaurant.basket["Burger"]).to eq 3
    end

    it "raises an error if an item not on the menu is entered" do
      expect{restaurant.add_order("Steak", 1)}.to raise_error "Not on menu"
    end
  end

  describe "check_order" do
    ### Can't get this passing
    it "prints the current order in a clean format" do
      restaurant.add_order("Burger")
      expect(restaurant.check_order).to output.to_stdout "Burger"
    end

    it "increases the total by the amount of the added item" do
      restaurant.add_order("Burger")
      expect{restaurant.add_order("Burger")}.to change{restaurant.total}.by 2.5
    end

    describe "total" do
    it "adds the price of the dish added to the order (and calculates quantity) " do
      restaurant.add_order("Burger", 2)
      expect(restaurant.total).to eq 5
    end
    end
  end
end
