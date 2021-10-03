class TakeAway
    MENU = {burger: 5, pizza: 4, chips: 3}
        attr_reader :item
        attr_reader :price
    
        def initialize()
            @price = 0 
            @quantity = 0 
            @total_price = 0 
            @pizza_quantity = 0 
            @burger_quantity = 0 
            @chips_quantity = 0
            @order = {}
        end 
    
        def see_menu
            MENU 
        end
    
        def select(item, quantity)
            fail "Selected item not available. Please see menu." if !MENU.member?(item) 
            @price = MENU[item] 
            @total_price += (@price * quantity) 
            if item == :burger
                @burger_quantity += quantity
            elsif item == :pizza 
                @pizza_quantity += quantity
            else 
                @chips_quantity += quantity
            end
        end
    
        def order_summary
            "Order Summary: pizza x#{@pizza_quantity}, burger x#{@burger_quantity}, chips x#{@chips_quantity}. Price Total: £#{@total_price}" 
        end
    
    end 