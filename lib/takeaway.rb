require_relative "menu"
require_relative "order"
require_relative "text_message"

class Takeaway

  attr_reader :menu, :order, :confirmed_order

  def initialize
    @order = Order.new
  end

  def see_menu
    @menu = Menu.new
    @menu.print
  end

  def add_to_order(dish, quantity = 1)
    @order.add(dish, quantity)
    "#{dish} x#{quantity} added to your basket"
  end

  def remove_from_order(dish, quantity)
    @order.remove(dish, quantity)
    "x#{quantity} portions of #{dish} removed from order"
  end

  def order_summary
    order_empty?
    @order.sub_total
  end

  def order_total
    order_empty?
    @order.total
  end

  def confirm_order
    order_empty?
    @confirmed_order = TextMessage.new
    @confirmed_order.send_text_message
    "SMS sent"
  end

  private

  def order_empty?
    error = "You haven't added any dishes to your order. Please add dishes"
    fail error if @order.basket.empty?
  end
end
