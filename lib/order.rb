class Order
    def initialize(menu)
       @menu = menu 
       @order_list = []
    end

    def pick(dish)
        @order_list << dish
    end

    def remove(dish)
        @order_list.delete(dish)
    end

    def list
        @order_list
    end

end