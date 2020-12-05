require_relative 'dish'

class Menu

  attr_reader :dishes

  def initialize(dish = Dish)
    @dish = dish
    @dishes = []
  end

  def add_dish(name, price)
    @dishes << @dish.new(name, price)
  end

  def print_menu
    @dishes.each { |item| return "#{item.name}: £#{item.price}" }
  end

end