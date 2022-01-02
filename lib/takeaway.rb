class Takeaway

    def initialize
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
        puts @menu
    end 


end 