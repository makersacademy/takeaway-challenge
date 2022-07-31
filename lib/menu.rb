class Menu
    attr_reader :dishes

    def initialize(dishes)
        @dishes = dishes
        @dish = {}
    end

    def price(dish)
        dishes[dish]
    end
end