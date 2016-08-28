require_relative "order"

class OrderLog

  def initialize(order_class = Order)
    @order_class = order_class
    @current_order = nil
    @order_history = []
  end

  def start_order
    fail "Current order must be completed before starting a new one" if current_order
    @current_order = order
  end

  def add_item(dish, quantity)
    validate_request
    @current_order.add_item(dish, quantity)
    "#{view_confirmation(dish.name, quantity)} been added to your basket"
  end

  def order_summary
    validate_request
    current_order.order_summary
  end

  def checkout_order(amount)
    validate_request
    fail "Checkout amount is not correct" unless checkout_amount_valid?(amount)
    finish_order(amount)
  end

  def total
    @current_order.total
  end

  private

  attr_reader :order_class, :current_order

  def view_confirmation(name, quantity)
    if quantity == 1 then "#{quantity}x #{name.downcase} has"
    else "#{quantity}x #{name.downcase}s have"
    end
  end

  def checkout_amount_valid?(amount)
    total == amount
  end

  def order
    order_class.new
  end

  def finish_order(amount)
    current_order.checkout_order(amount)
    @order_history << current_order
    @current_order = nil
  end

  def validate_request
    start_order unless current_order
  end
end
