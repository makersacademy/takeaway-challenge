class Menu

    def initialize
        @menu_items = []
        @available = true
    end

    def add(dish)
        @menu_items << dish
    end

    def remove(dish)
        if @menu_items.include?(dish)
            @menu_items.delete(dish)
        else
            fail "unknown dish"
       end
    end

    def list
        @menu_items
    end

    







end

    



