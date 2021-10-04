class Dishes
    attr_accessor :my_menu

    def initialize
        @my_menu = {}
    end

    def create_menu(name_of_dish, price)
        my_menu[name_of_dish] = price
    end

    def view_menu
        p my_menu 
    end

end