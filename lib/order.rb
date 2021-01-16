class Order
    def initialize
        @items = []
    end

    def add(dish)
        @items << dish
        @items[-1]
    end
end