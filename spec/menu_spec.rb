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
    end
end
