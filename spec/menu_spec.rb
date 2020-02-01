require "menu"
describe Menu do

    describe "#show" do 
        it "should print all food items" do
            food_double = double :food, name: "test", price: 1
            food_class_double = double :food_class, new: food_double
            subject = Menu.new(food_class_double)
            subject.add("test", 1)
            expect(subject.show).to eq([food_double])
        end
    end
    describe "#add_to_order" do
        it "should add food item to array in order object" do
            food_double = double :food, name: "test", price: 1
            order_double = double :order
            food_class_double = double :food_class, new: food_double
            order_class_double = double :order_class, new: order_double
            subject = Menu.new(food_class_double, order_class_double)
            subject.add("test", 1)
            expect(subject.add_to_order(food_double)).to eq([food_double])
        end
    end

end
