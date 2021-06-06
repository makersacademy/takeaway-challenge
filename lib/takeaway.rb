
class Takeaway

    attr_reader :menu, :order
    
    def initialize(our_menu, the_order)
       @menu = our_menu
       @order = the_order 
    end
    
    def print_menu
     @menu.print
    end

    def place_order(dishes)
      dishes.each do |dish_to_check, quantity|
        order.add(dish_to_check, quantity)
      end
      order.total
    end
end