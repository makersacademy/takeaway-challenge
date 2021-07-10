

class Menu
    attr_reader :menu_name, :current_menu 
    

    def initialize(name)
    @menu_name = name
    @current_menu = []
    end

    def add(dish)
        fail "Dont add doubles to the Menu" if @current_menu.include?(dish) 
        @current_menu.push(dish)
    end

    def remove(dish)
        fail "Cant remove non-added Dish from Menu" if @current_menu.include?(dish) == false
        @current_menu.delete(dish)
    end

    def view
        @current_menu.each_with_index do |item, index|
            puts "#{index+1}. Name: #{item.name}, Price: #{item.price}$"
        end
    end

   
    
end
