require "./lib/dish.rb"

describe Dish do

    let(:dish) {Dish.new(name="Dish 1", price=10.00)}
    let(:menu) {double(:menu_list)}

    describe "#initialize" do
        it "should return a name on intialize" do
            expect(dish.name).to eq 'Dish 1'
        end

        it "should return a price on itialize" do
            expect(dish.price).to eq 10.00
        end
    end
end