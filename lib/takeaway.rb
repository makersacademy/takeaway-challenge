require_relative 'menu'
require_relative 'order'
require_relative 'text'

class TakeAway
  attr_reader :menu, :order, :text

  def initialize (menu = Menu.new, order = Order.new(menu), text = Text.new)
    @menu = menu
    @order = order
    @text = text
  end

  def view_menu
    menu.print_menu
  end

  def add(dish, quantity)
    order.add(dish, quantity)
    "#{quantity} x #{dish} added to basket"
  end

  def review
    order.print_order
  end

  def checkout(payment)
    raise "Incorrect payment received" if payment != order.sum
    confirmation
  end

private
  attr_reader :time

  def confirmation
    text.send_message("Thank you! Your order was placed and will be delivered by #{time}")
    return "Order has been completed"
  end

  def time
    time_in_an_hour = Time.new + 3600
    time_in_an_hour.strftime("%H:%M")
  end
end
