require 'dishes'

describe Dishes do

    let(:my_dishes) { Dishes.new }

    describe "#create_menu" do
        it "Should add a new dish to the menu with a name and price" do
            price = 8.95
            expect(my_dishes.create_menu("Chicken Tikka", price)).to eq price
        end
    end

    describe "#view_menu" do
        it "Should show a menu with a names and prices of all dishes" do
            my_dishes.create_menu("Chicken Tikka", 8.95)
            my_dishes.create_menu("Lamb Tikka", 8.95)
            expect(my_dishes.view_menu).to eq(my_dishes.my_menu)
        end
    end

end