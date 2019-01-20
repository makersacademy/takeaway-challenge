require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu, :order

  def initialize(menu = Menu, order = Order, sms = SMS)
    @menu = menu.new
    @order = order.new
    @sms = sms.new
  end

  def print_menu
    @menu.print_menu
  end

  def add_to_order(menu_number, quantity)
    quantity.times { @order.add(menu_item(menu_number)) }
    "#{quantity}x #{menu_item(menu_number).name} added to order"
  end

  def place_order(price)
    total
    price == total ? delivery_message : error_message
  end

  private

  def delivery_message
    @sms.send_confirmation
  end

  def total
    @order.total
  end

  def menu_item(dish_number)
    @menu.list[dish_number]
  end

  def error_message
    raise("Total given is not correct")
  end

end
