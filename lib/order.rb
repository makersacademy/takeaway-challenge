require_relative 'menu'
require_relative 'confirmation'

class Order
  # order understands the process of ordering food
  attr_reader :basket, :menu, :total

  DEFAULT_QUANTITY = 1

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = {}
    @total = 0
  end

  def select_dish(dish, quantity = DEFAULT_QUANTITY)
    message = "Order could not be taken: not on the menu"
    fail message if not_on_menu?(dish)
    add_to_basket(dish, quantity)
    increment_total_order_number(quantity)
  end

  def place_order(confirmation = Confirmation.new)
    confirmation.send
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
