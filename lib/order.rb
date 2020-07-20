class Order
    attr_reader :dishes

    def initialize(menu)
        @dishes = {}
        @menu = menu 
    end

    def add(dish, amount)
        fail NoItemError, "#{dish.capitalize} are not available" unless menu.has_dish?(dish)
      dishes[dish] = amount
    end

    private

    attr_reader :menu
end

class NoItemError < StandardError; end