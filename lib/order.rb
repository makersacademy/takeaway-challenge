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
    fail message if not_on_menu?(dish)
    add_to_basket(dish, quantity)
    increment_total_order_number(quantity)
  end

  private

  def not_on_menu?(dish)
    !@menu.choices.has_key?(dish)
  end

  def increment_total_order_number(quantity)
    @total += quantity
  end

  def add_to_basket(dish, quantity)
    @basket[dish] = quantity
  end

end
