require_relative "order"

# Understands how to take orders from the customer
class Takeaway
  def initialize(current_order = Order.new)
    @current_order = current_order
    @profit = 0
  end

  def menu
    current_order.menu.items.dup
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
    charge_customer
    @current_order = Order.new
    basket
  end

  private

  attr_reader :current_order

  def charge_customer
    @profit += total
  end
end
