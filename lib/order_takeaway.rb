class Order
    attr_reader :dishes

    def initialize(menu) #inject the menu object
        @dishes = {}
        @menu = menu
    end

    def add(dish, quantity)
        fail RuntimeError, "#{dish} is not on the menu!" unless menu.has_dish?(dish)
        dishes[dish] = quantity
    end
    
    def total
     item_totals.inject(:+)
    end 
   
    
    private
    attr_reader :menu

    def item_totals
        dishes.map do |dish, quantity|
            menu.price(dish) * quantity
        end
    end
end
