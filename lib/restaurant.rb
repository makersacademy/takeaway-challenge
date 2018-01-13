require_relative "menu"
require_relative "order"
require_relative "sms"

class Restaurant

  attr_reader :order, :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def print_menu
    @menu.print
  end

  def place_order(order = Order.new(@menu.menu_items))
    @order = order
  end

  def confirm_order(text = SMS.new)
    @text = text
    @text.send_sms
  end

end
