require './lib/menu'

class Order
    
    def show_menu(menu)
        i = 1
        menu.each do |item|
            puts "#{i}. #{item[:dish]} #{item[:price]}"
            i +=1
        end
    end
    
    def order(dish)
        
    end
end