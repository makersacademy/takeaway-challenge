require 'restaurant'

describe 'User Stories' do
    
    subject(:restaurant) { Restaurant.new }
    
    describe 'User Story 1' do
        # As a customer
        # So that I can check if I want to order something
        # I would like to see a list of dishes with prices
        it 'can show a menu' do
            printed_dishes = "Lamb Rogan Josh £9.25, Chicken Madras £8.95."
            expect(restaurant.show_menu).to eq(printed_dishes)
        end
    end
end