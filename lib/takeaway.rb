class TakeAway
MENU = {burger: 5, pizza: 4, chips: 3}
    attr_accessor :item

    def initialize()
        @price = 0 #(price holds set price of food item)
        @quantity = 0 #(adds, say 3 burgers to order)
        @total_price = 0 #(quantity * price)
        @pizza_quantity = 0 #(stores overall number of pizzas)
        @burger_quantity = 0 #(stores overall number of burgers)
        @chips_quantity = 0 #(stores overall number of chips)
    end 

    def see_menu
        MENU #(method allows user to see items and prices)
    end

    def select(item, quantity)
        fail "Selected item not available. Please see menu." if !MENU.member?(item) #(throws an error if requested item is not on menu)
        @price = MENU[item] #(sets the price to whatever food item it corresponds with (pizza: 4))
        @total_price += (@price * quantity) #(total_price accumulates the overall cost - this works fine)
        if item == :burger
            @burger_quantity += quantity
        elsif item == :pizza 
            @pizza_quantity += quantity
        else 
            @chips_quantity += quantity
        end
    end

    def total_order
        "Order Summary: pizza x#{@pizza_quantity} Price Total: £#{@total_price}" #(total order returns )
    end

    # def full_summary 
    #     @order_summary.each { |x|
    #         puts x
    #     }
    # end

end 