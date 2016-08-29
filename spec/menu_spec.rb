require 'menu'

describe Menu do

let (:menu) {{"Burger" => 2.50,
              "Wings" => 3.00,
              "Meal" => 4.00,
              "Shake" => 2.50}}

  describe "List of dishes" do
    it "returns a list of the dishes and prices" do
      expect(subject.dishes).to eq menu
    end

  describe "#dish_on_menu" do
    it "Raises an error if dish is not on menu" do
      expect{subject.dish_on_menu("Steak")}.to raise_error "Not on menu"
    end
  end

  describe "#price" do
    it "finds the price of a given dish" do
      expect(subject.price("Burger")).to eq 2.50
    end
  end
end
end
