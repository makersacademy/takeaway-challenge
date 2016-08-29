#understands the orders stored in order history
require_relative "order"

class OrderLog

  def initialize(order_class = Order)
    @order_class = order_class
    @current_order = nil
    @order_history = []
  end

  def start_order #creates a new order and assigns it to current order
    fail "Current order must be completed before starting a new one" if current_order
    @current_order = order
  end

  def add_item(dish, quantity) #add new item to the current order
    validate_request
    @current_order.add_item(dish, quantity)
    "#{conf_message(dish.name, quantity)} been added to your basket"
  end

  def order_summary #returns summary of the current order
    validate_request
    current_order.order_summary
  end

  def checkout_order(amount) #checks out the order
    validate_request
    finish_order(amount)
  end

  def total #returns the total value of the current order
    validate_request
    @current_order.total
  end

  private

  attr_reader :order_class, :current_order

  def conf_message(name, quantity)
    if quantity == 1 then "#{quantity}x #{name.downcase} has"
    else "#{quantity}x #{name.downcase}s have"
    end
  end

  def order #creates a new order
    order_class.new
  end

  def finish_order(amount)
    current_order.checkout_order(amount)
    @order_history << current_order
    @current_order = nil
  end

  def validate_request #calls start_order emethod is there is no current order
    start_order unless current_order
  end
end
