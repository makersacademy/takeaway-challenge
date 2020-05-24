require_relative './order'
require_relative './menu'
require_relative './send_sms'

class Takeaway

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def see_menu
    @menu.get_menu
  end

  def select(dish,quantity)
    if check_if_on_menu(dish)
      puts "I'm sorry, we don't have that on our menu."
    else
      price = get_price(dish)
      @order.add_selection(dish, quantity, price)
    end
  end

  def see_order
    puts @order.get_order
    print see_total
  end

  def confirm_order(amount)
    raise "That isn't the right amount." if amount != @order.total
    send_sms
    print "Order confirmed!"
  end

private

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
