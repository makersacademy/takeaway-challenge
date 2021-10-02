require 'menu'

class TakeAway

    def initialize(item = Menu.new.random_dish, quantity = rand(1..5))
        @item = item
        @quantity = quantity
        @order = []
    end 

    def see_dishes
        DISHLIST
    end

    def select(item, quantity)
        quantity.times do 
            @order << item
        end
    end

    def total_order
        @order
    end

    def print_item
        @item
    end

    DISHLIST = [:burger, :pizza, :chips]

    # def num_of_item(quantity)
    #     quantity = rand(1..5)
    # end 
    # # def add_to_order 

    # # end

end 