require_relative 'dish'

class DishList

    attr_reader :all_dishes, :checkout_basket, :total_price

    def initialize
      @all_dishes = []
      @total_price = 0
      @checkout_basket = []
    end

    def add_dish_to_list(dish)
      @all_dishes << dish
    end

    def new_order
      @checkout_basket = []
    end

    def add_dish_to_basket(dish)
      @checkout_basket << dish
      @total_price += dish.price
    end

    # def get_all_dishes_from_file
    #   @all_dishes
    #   # @all_dishes << File.read('dishes.txt', 'r')
    #   # file.each_line
    # end
    #
    # def add_dish_to_file(dish)
    #   file = File.open('dishes.txt', 'w')
    #   file.write(dish.name)
    #   file.write(",")
    #   file.write(dish.price)
    #   file.close
    # end
end
