require_relative 'dish.rb'

class Order

  def initialize
    @basket = {}
  end

  def print
    dishes = Dish.new
    dishes.menu.map { |key, value| "#{key}: #{value}" }.each do |dish|
      return dish
    end
  end

  def select(dish)
    dishes = Dish.new
    raise "Dish not available!" unless dishes.on_the_menu?(dish)
    @basket[dish.to_sym] = dishes.menu[dish.to_sym]
    print
  end

  # def add(dish)
  #  In the near future, this can be a method that adds the selected dish into the basket, thus replacing line 19
  # end
end
