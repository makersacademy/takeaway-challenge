class Order

    attr_reader :dishes

    def initialize(menu)
      @dishes = []
      @menu = menu
      @dish = {}
    end

    def add_dish(food, quantity)
        @dish = {
            :food  => food,
            :quantity => quantity
        }
        @dishes << @dish
    end 

end