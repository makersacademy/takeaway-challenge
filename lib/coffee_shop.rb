require_relative "order"

# Understands how to take orders from the customer
class CoffeeShop
  def initialize(current_order = Order)
    @current_order = current_order.new
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

  def add(name, quantity = 1)
    current_order.add_to_order(name, quantity)
  end

  def checkout
    charge_customer
    @current_order = Order.new
  end

  private

  attr_reader :current_order

  def charge_customer
    @profit += total
  end
end
