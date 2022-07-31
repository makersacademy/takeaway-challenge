require "dish"

describe "Dish" do 
    describe "#initialize" do
        it "creates the dish name" do
            dish = Dish.new("Pasta", 2)
            expect(dish.name).to eq "Pasta"
        end

        it "sets a price for the dish" do
            dish = Dish.new("Pasta", 2)
            expect(dish.price).to eq 2
        end
    end

    describe "#change_price" do
        it "changes price to set value" do
            dish = Dish.new("Pasta", 2)
            dish.change_price(3)
            expect(dish.price).to eq 3
        end
    end

    describe "#rename" do
        it "changes name to new entry" do
            dish = Dish.new("Pasta", 2)
            dish.rename("Tempura")
            expect(dish.name).to eq "Tempura"
        end
    end
end