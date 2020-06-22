class Takeaway
    def initialize
        @menu = ["pizza","burger","salad", 5, 4, 2]
    end 
    def show_menu
        @menu
    end 
    
    def order(list_dishes, list_quantity, total)
        fail 'total is incorrect' if total != list_quantity.inject(:+)
        true 
    end 
end 