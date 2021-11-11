require 'menu'

class Takeaway
  
  attr_reader :menu , :order

    def initialize(menu = Menu.new)
      @menu = menu
      @order = []
      @total = []
    end 

    def print_menu
      @menu.menu_items
    end

    def place_order(dishes)
     dishes.each do |dish|
      @menu.menu_items.map do |key, value|
        if key.include?(dish) 
          @order.push(dish)
        end 
      end 
    end
      @order
    end 

    def order_total
      @menu.menu_items.map do |key, value|
        @order.each do |order|
          if key.include?(order)
          @total.push(value)
        end
      end
    end 
    @total.sum
    end

  end 
