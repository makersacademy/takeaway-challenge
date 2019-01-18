require_relative 'menu'

# Lets user see menu, select dishes, view order, finalize order
class Interface
  def initialize(menu = Menu.new)
    @menu = menu
    @selected_dishes = {}
  end

  def see_list
    output = []
    menu.items.each { |key, value| output << [key, value] }
    output
  end

  def select_dish(dish, quantity = 1)
    @selected_dishes[dish] = quantity
  end

  def verify_order
    output = []
    selected_dishes.each { |dish, quantity| output << [dish, quantity] }
    output.each { |line| line << price(line[0], line[1]) }
    output
  end

  private

  attr_reader :menu, :selected_dishes

  def price(dish, quantity)
    menu.items[dish] * quantity
  end
end
