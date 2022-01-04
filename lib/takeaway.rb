class Takeaway

    attr_accessor :order, :menu

MENU = {  
        :Beer => 4.00,
        :Cola => 2.50,
        :Tap_water => 0.50,
        :Burger => 6.00,
        :Veggie_burger => 5.00,
        :Chips => 2.00,
        :Salad => 3.50 
    }

    def initialize
        @order = {}
    end

    def view_menu
        MENU
    end 

    def order_item(choice)
        if  order.key?(choice) == false
            order[choice] = 1
        elsif
            order[choice] = order[choice] + 1
        else 
            #raise "Item is not currently on the menu." if choice != MENU[choice]
        end
        puts "#{order.values}x portions of #{choice}(s) have now been added to your order."
    end



end

