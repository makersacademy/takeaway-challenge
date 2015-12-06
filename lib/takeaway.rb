require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def view_menu
    @menu.dishes
  end

  def view_order
    @order.view
  end

  def add_to_order(dish_name, quantity=1)
    dish = @menu.get_dish(dish_name)
    @order.add(dish, quantity)
  end

  def remove_from_order(dish_name)
    dish = @menu.get_dish(dish_name)
    @order.remove(dish)
  end

  def total_price
    @order.total
  end

  def checkout(total)
    return @order.confirm if total == @order.total
    fail "Incorrect amount. Your order total is: #{total_price}"
  end
end
