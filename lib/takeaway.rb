class Takeaway
    def initialize(dishes = Dishes.new)
        @dishes = dishes
    end

    def show_menu
        return @dishes.dishes_arr.each { |dish| print dish }
    end

    def order(dish)
        @dishes.dishes_arr.select { |item| item == dish }
    end
end