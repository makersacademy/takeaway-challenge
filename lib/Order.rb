# pull the menu into this file
require_relative 'Menu'

class Order 

    def initialize
      @order =  []
      @sum_of_order
      @total = 0
    end

    def order_items(name,quantity)
        menu = Menu.new
        a = menu.get_menu
        a.each_pair{  |k, v| puts "Meal: #{k}, Price: £#{v}. How many of this meal do you want?" }
        order[name] = quantity

    end

    def order
      puts "what do you want ot order, select from options below:"
      @menu.display 
      choice = gets.chomp
    end

    def select_dish(input)
        menu = Menu.new
      if menu.display_menu[input].nil?
        puts "We do not serve that item."
      else
        puts "You have selected #{input}"
        @order << input
      end

    end

    def total
        menu = Menu.new
        
        @order.each do |name|
            @total += menu.display_menu[name]
         
        end
        return @total 
    end

end
