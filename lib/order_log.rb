require_relative "order"

class OrderLog

  def initialize(order_class = Order)
    @order_class = order_class
    @current_order = nil
    @order_history = []
  end

  def start_order
    @current_order = order
  end

  def add_item(dish, quantity)
    @current_order.add_item(dish, quantity)
    "#{view_confirmation(dish.name, quantity)} been added to your basket"
  end

  def checkout_order(amount)
    fail "Checkout amount is not correct, order is not completed" unless checkout_amount_valid?(amount)
    @order_history << current_order
    @current_order = nil
  end

  private

  attr_reader :order_class, :current_order

  def view_confirmation(name, quantity)
    if quantity == 1 then "#{quantity}x #{name.downcase} has"
    else "#{quantity}x #{name.downcase}s have"
    end
  end

  def checkout_amount_valid?(amount)
    @current_order.total == amount
  end

  def order
    order_class.new
  end
end
