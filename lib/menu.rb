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

  def check_total(order, given_total)
    totalizer(order) == given_total
  end

  private

  def totalizer(order)
    price_array = []
    order.each { |dish| price_array << dish.price }
    price_array.sum
  end
end