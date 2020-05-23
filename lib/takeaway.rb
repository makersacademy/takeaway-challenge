require_relative './order'
require_relative './menu'

class Takeaway

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def see_menu
    puts @menu.print_menu
  end

  def select(dish,quantity)
    raise "I'm sorry, we don't have that on our menu." if @menu.not_on_menu?(dish)

    price = get_price(dish)
    @order.add_selection(dish, quantity, price)
  end

private

  def get_price(dish)
    @menu.get_price_for(dish)
  end
end
