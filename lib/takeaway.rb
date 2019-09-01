require_relative './menu'
require_relative './order'
require_relative './text_message'
class Takeaway
  attr_reader :menu, :order
  def initialize(menu = Menu.new)
    @menu = menu
  end

  def view_menu
    @menu.display_menu
  end

  def order_food(dish, quantity = 1, order = Order.new)
    @order = order
    @order.select_dish(dish, quantity)
  end

  def check_order
    @menu.view_total(@order)
  end

  def submit_order(sms = TextMessage.new)
    sms.send_text
  end

end
