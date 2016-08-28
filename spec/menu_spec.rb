require 'menu'

describe Menu do

let (:menu) {[{ name: "Chicken Fillet Burger", price: 2.50}, {name: "Buffalo Wings", price: 3.00}, {name: "Tower Burger Meal", price: 4.00}]}

    describe " array of dishes" do
      it "returns a list of the dishes and prices" do
        expect(subject.dishes).to eq menu
      end
    end
end
