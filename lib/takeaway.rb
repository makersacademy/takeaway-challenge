require_relative 'menu'
require_relative 'order'
require_relative 'message'

class Takeaway

  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def see_menu
    menu.show_menu
  end

  def order(dish, quantity)
    menu.order_dish(dish, quantity)
  end

  def check_order
    menu.order.final_order
  end

  def confirm_order(amount)
    fail "Incorrect amount given" unless menu.order.total == amount
    send_message
  end

end
