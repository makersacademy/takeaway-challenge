require_relative 'print'
require_relative 'order'
require_relative 'menu'

class Restaurant
  include Print

  def initialize(menu = Menu.new, order = Order.new)
    @order = order
    @menu = menu
  end

  def read_menu
    print_menu(@menu)
  end

  def order(dish, quantity = 1)
    dish = dish.downcase
    raise print_unavailable(dish) unless available?(dish)
    @order.add(dish, quantity)
  end

  def add(dish, quantity = 1)
    order(dish, quantity)
  end

  def basket
    @order.basket
  end

  def total(input)
    @order.total(input)
  end

  def checkout(total)
    @order.checkout
    print_checkout(total)
  end

  private

  def available?(order)
    @menu.cuisine.include?(order)
  end

end
