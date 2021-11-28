require 'order'
require 'menu'

describe Order do

    before do
        @menu = Menu.new( [ Dish.new("pizza", 8), Dish.new("fish", 10) ] )
        @order = Order.new(@menu)
    end
    
    it 'raises error if dish not in menu' do
        expect {@order.add_to_order( Dish.new("chips", 3), 2 )}.to raise_error("Dish not in menu")
    end

    it 'checks that existing dish in menu and amount is added to myorder' do
        pizza_dish = Dish.new("pizza", 8)
        @order.add_to_order( pizza_dish , 2)
        expect(@order.myorder).to include(pizza_dish)
        expect(@order.myorder[pizza_dish]).to eq 2
    end
end