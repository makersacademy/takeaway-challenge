require 'restaurant'

describe 'User Stories' do
    
    subject(:restaurant) { Restaurant.new(menu: Menu.new("./spec/dishes.txt")) }
    
    describe 'User Story 1' do
        # As a customer
        # So that I can check if I want to order something
        # I would like to see a list of dishes with prices
        it 'can show a menu' do
            printed_dishes = "Lamb Rogan Josh £9.25, Chicken Madras £8.95."
            expect(restaurant.show_menu).to eq(printed_dishes)
        end
    end
    
    describe 'User Story 2 + 3' do
        # As a customer
        # So that I can order the meal I want
        # I would like to be able to select some number of several available dishes
        
        # As a customer
        # So that I can verify that my order is correct
        # I would like to check that the total I have been given matches the sum of the various dishes in my order
        it 'can take an order for a quantity of dishes and return a total' do
            total = "Your order total is: £27.15"
            order = "Lamb Rogan Josh 1, Chicken Madras 2"
            expect(restaurant.take_order(order)).to eq(total)
        end
    end
end