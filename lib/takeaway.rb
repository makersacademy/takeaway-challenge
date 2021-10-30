require 'menu'

class Takeaway
  
  attr_reader :menu , :order

    def initialize(menu = Menu.new)
      @menu = menu
      @order = []
    end 

    def print_menu
      @menu.menu_items
    end

    def place_order(dishes)
      # @menu.menu_items.include?(dishes)
    dishes.each do |dish|
      @menu.menu_items.map do |key, value|
        if key.include?(dish) 
          @order.push(dish)
        end 
      end 
      @order
    end 
  end
  
  end 
