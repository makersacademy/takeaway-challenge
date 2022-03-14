require 'menu'
require 'dish'
require 'order'

describe Menu do
    
    before do
        @menu = Menu.new( [ Dish.new("pizza", 8), Dish.new("fish", 10) ] )
    end

    context 'tests the list method' do
        it 'checks that list shows dish name and price' do
            expected = "pizza: 8\nfish: 10"
            expect(@menu.list).to eq(expected)
        end
    end
end