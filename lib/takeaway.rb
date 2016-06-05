require_relative "order"
require_relative "message"

# Understands how to take orders from the customer
class Takeaway
  def initialize(current_order = Order.new)
    @current_order = current_order
    @profit = 0
  end

  def menu
    current_order.menu.dup
  end

  def total
    current_order.calculate_total
  end

  def basket
    current_order.basket
  end

  def add_to_basket(name, quantity = 1)
    current_order.update_basket(name, quantity)
    basket
  end

  def checkout
    fail "Nothing to check out!" if empty?
    charge_customer
    complete_order
  end

  private

  attr_reader :current_order

  def empty?
    basket.empty?
  end

  def charge_customer
    @profit += total
  end

  def send_message(message = Message.new)
    message.send_message(total)
  end

  def complete_order
    msg = send_message
    @current_order = Order.new
    msg
  end
end
