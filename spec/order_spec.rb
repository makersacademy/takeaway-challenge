require "order"
describe Order do
    describe "#add_to_basket" do
        it "should add food item to basket array" do
            food_double = double :food
            expect(subject.add_to_basket(food_double)).to eq([food_double])
        end
    end
    describe "#total" do
        it "should print a total of all foods in basket with prices" do
            food_double = double:food, name: "double", price: 5
            subject.add_to_basket(food_double)
            subject.add_to_basket(food_double)
            subject.add_to_basket(food_double)
            expect(subject.total).to eq("Your total is £15")
        end
    end

end