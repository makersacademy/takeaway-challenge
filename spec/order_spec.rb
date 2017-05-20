require "order"

describe Order do
subject(:order) { described_class.new }

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

  describe "#selection_of_dish" do
    it "should raise an error if the dish a user has chosen is not on the menu" do
      expect{ order.selection_of_dish("pork", 2) }.to raise_error "Dish not in menu: please select a dish from the menu"
    end

    it "should raise an error if the number of dishes inputted is not an integer" do
      expect{ order.selection_of_dish("chicken", "not a number") }.to raise_error "That is not a number, please enter a valid number"
    end

    it "should select the dish and the amount of that dish a user wants" do
      expect(order.selection_of_dish("chicken", 2)).to eq([{dish: "chicken", amount: 2}])
    end

    it "once you have selected your order, it should allow you to increment or keep the same quantity of the meal" do
      allow(order).to receive(:selection_of_dish) { :chicken }
      allow(order).to receive(:number_of_meals) { "You have selected 2 chicken" }
      expect(order.number_of_meals(2)).to eq "You have selected 2 chicken"
    end
  end
end
