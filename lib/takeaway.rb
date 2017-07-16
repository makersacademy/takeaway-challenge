require_relative 'menu'
require_relative 'order'
require_relative 'messager'

class Takeaway

  attr_reader :menu, :order, :messager

  def initialize(menu_class = Menu, order_class = Order, messager_class = Messager)
    @menu = menu_class.new
    @messager = messager_class.new
    @order = order_class.new
  end

  def view_menu
    print menu.to_s
  end

  def add(item, quantity = 1)
    order.add(item, quantity)
  end

  def view_order
    print order.to_s
  end

  def total
    puts order.total
  end

  def complete_order(payment)
    raise "Payment does not match total" if order.total != payment
    send_text("Thank you! Your order was placed and will be delivered soon.")
    puts "Thank you for your order, confirmation has been sent via text message"
  end

  def send_text(message)
    messager.send_text(message)
  end

  private

  def delivery_time
    t = Time.new + 60 * 30
    t.strftime("%H:%M")
  end

end
