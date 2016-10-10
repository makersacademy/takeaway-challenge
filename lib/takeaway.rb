require_relative "dish"
require_relative "order"
require_relative "menu"

class Takeaway

  attr_reader :order, :total, :menu

  def initialize(order = Order.new, menu = Menu.new )
    @order = order
    @menu = menu
    @total = 0
  end

  def see_menu
    menu.menu
  end

  def add(dish, quantity = 1)
    order.add(dish, quantity)
    charge
  end

  def basket_summary
    puts "Your order: "
    order.order.each {|item| print "#{item[:dish]} x #{item[:quantity]} = #{(order.price) * order.quantity}£ "}
  end

  def complete_order
    send_text("Thank you for your order: £#{@total}")
  end

  private

  def charge
    @total += (order.price) * order.quantity
  end
end
