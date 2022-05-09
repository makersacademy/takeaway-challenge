require_relative "menu"

class Order

  attr_reader :dishes, :order, :total

    def initialize
      @total = 0
      @dishes = Menu.new
      @order = []
    end

    def dish(dish, quantity)
      @order << dish

    end

end
