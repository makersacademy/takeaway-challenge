require 'dotenv/load'
require_relative 'menu'
require_relative 'order'
require_relative 'sms'

class Takeaway
  def initialize(menu = Menu.new, order = Order.new(menu), sms = Sms.new)
    @menu = menu
    @order = order
    @sms = sms
  end

  def read_menu
    menu.show_menu
  end

  def add_to_order(dish, amount)
    order.add_product(dish, amount)
  end

  def check_total
    order.total
  end

  def checkout
    message = "Thank you! Your order was placed. The total is £#{check_total}."
    sms.send(message)
  end

  private

  attr_reader :menu, :order, :sms
end
