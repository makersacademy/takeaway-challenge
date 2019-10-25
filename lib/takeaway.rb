class Takeaway
    attr_reader :order
    attr_reader :price

    def initialize(dishes = Dishes.new)
        @dishes = dishes
        @order = []
        @price = []
    end

    def show_menu
        return @dishes.dishes_arr.each { |dish| print dish }
    end

    def order_item(dish, amount = 1)
        item = @dishes.dishes_arr.select { |list| list[:item] == dish }.first
        amount.times {
            @order << item
        }
    end

    def order_sum
        @order.each { |k,v| @price << k }
    end
end