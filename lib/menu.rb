class Menu
    attr_reader :dishes

    def initialize(dishes)
        @dishes = dishes
        @dish = {}
    end

    def price(dish)
        dishes[dish]
    end

    # def add_dish(food, price)
    #     @dish = {
    #         :food  => food,
    #         :price => price
    #     }
    #     @dishes.push(@dish)
    # end 
end