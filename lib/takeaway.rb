#require 'order'
#require 'menu'
class Takeaway

    #takeaway first attribute: menu
    attr_reader :menu, :order
    
    #menu set as our_menu
    def initialize(our_menu, the_order)
       @menu = our_menu
       @order = the_order #|| Order.new
    end
    
    #print out our_menu(@menu)
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