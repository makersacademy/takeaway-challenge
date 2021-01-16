class Order

    attr_reader :menu
    
    def initialize(menu)
        @menu = menu
        @items = []
    end

    def add(dish)
        @items << dish
        @items[-1]
    end
end