require 'menu'

class TakeAway

    def initialize(item = Menu.new)
        @item = item
        @order = []
    end 

    def see_dishes
        DISHLIST
    end

    DISHLIST = [:burger, :pizza, :chips]
    # def num_of_item(quantity)
    #     quantity = rand(1..5)
    # end 
    # # def add_to_order 

    # # end

end 