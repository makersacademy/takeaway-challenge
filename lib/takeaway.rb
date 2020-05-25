require_relative './order'
require_relative './menu'
require_relative './send_sms'

class Takeaway

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def see_menu
    puts @menu.get_menu
    order_prompt
  end

  def select(dish,quantity = 1)
    if check_if_on_menu(dish)
      "I'm sorry, we don't have that on our menu."
    else
      price = get_price(dish)
      @order.add_selection(dish, quantity, price)
    end
  end

  def see_order
    puts @order.get_order
    return see_total
  end

  def confirm_order(amount)
    raise "That isn't the right amount." if amount != @order.total
    send_sms
  end

private

  def order_prompt
    "What would you like to order?"
  end

  def check_if_on_menu(dish)
     @menu.not_on_menu?(dish)
  end

  def get_price(dish)
    @menu.get_price_for(dish)
  end

  def see_total
    @order.get_total
  end
end
