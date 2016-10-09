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
  end

  def review
    order.print_order
  end

  def checkout(payment)
    raise "Incorrect payment received" if payment != order.sum
    "Payment received"
  end

  def confirmation(message = MESSAGE, customer_mobile)
    text.send_message(message,customer_mobile)
    return "Order has been completed"
  end

private

  time_in_an_hour = Time.new + 3600
  time = time_in_an_hour.strftime("%H:%M")

  MESSAGE = "Thank you! Your order was placed and will be delivered by #{time}"

end
