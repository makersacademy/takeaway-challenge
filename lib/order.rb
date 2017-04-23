require './lib/menu'

class Order
    
    attr_reader :menu
    
    def initialize(menu = [])
        @menu = menu
        @order = []
    end
    
    def add_menu(menu)
        
        @menu = menu
        
    end
    
    def show_menu
        i = 1
        @menu.dishes.each do |item|
            puts "#{i}. #{item[:dish]} #{item[:price]}"
            i +=1
        end
    end
    
    def order(dish)
        @order << @menu.dishes[dish -1]
    end
end