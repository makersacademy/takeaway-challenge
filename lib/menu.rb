class Menu
    attr_reader :menu_name, :current

    def initialize(name)
    @menu_name = name
    @current = []
    end

    def add(dish)
        fail "Dont add doubles to the Menu" if @current.include?(dish) 
        @current.push(dish)
    end

    def remove(dish)
        fail "Cant remove non-added Dish from Menu" if @current.include?(dish) == false
        @current.delete(dish)
    end

    def view
        @current.each do |item|
            puts "Name: #{item.name}, Price: #{item.price}$"
        end
    end
end
