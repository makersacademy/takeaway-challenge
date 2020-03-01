require_relative "menu"

class Order

  attr_reader :dishes

    def initialize
      @total = 0
      @dishes = Menu.new
    end

    def dish(dish, quantity)


    end

end
