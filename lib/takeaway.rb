require_relative 'menu'
require_relative 'order'
class Takeaway 
  attr_reader :menu
  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def view_menu
    @menu.view_dishes
  end

  def add_to_order(dish, price, quantity)
    raise "Dish unavailable" if @menu.available?(dish) == false

    @order.add(dish, price, quantity)
  end

  def view_order
    @order.view
  end

  def order_total
    puts "You basket contains #{@order.dish_count} dishes with the total value of £#{@order.total_cost}, please confirm your order."
  end
end
