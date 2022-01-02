class Takeaway

    def initialize
        @order = {}
        @menu = {  
            :Beer => 4.00,
            :Cola => 2.50,
            :Tap_water => 0.50,
            :Burger => 6.00,
            :Veggie_burger => 5.00,
            :Chips => 2.00,
            :Salad => 3.50 
        }
    end

    def view_menu
        @menu
    end 

    def select_item

    end

end
