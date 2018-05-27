require_relative 'menu'
class Order
  # order understands the process of ordering food
  attr_reader :basket, :menu, :total

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = {}
    @total = 0
  end

  def select_dish(dish, quantity)
    message = "Order could not be taken: not on the menu"
    fail message unless @menu.choices.has_key?(dish)
    @basket[dish] = quantity
    @total += quantity
  end

end
