require_relative 'menu'

# Lets user read a menu and place an order
class Interface
  def initialize(menu = Menu.new)
    @menu = menu
    @selected_dishes = {}
  end

  def see_list
    output = []
    menu.items.each { |k, v| output << k + ", " + v.to_s }
    output.join("\n")
  end

  def select_dish(dish, quantity = 1)
    @selected_dishes[dish] = quantity
  end

  private

  attr_reader :menu
end
