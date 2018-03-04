require_relative './order.rb'
require_relative './menu.rb'

class TakeAway
  attr_reader :menu, :curr_order, :payment

  def initialize(order = Order, menu = Menu)
    @order = order
    @menu = menu.new
    @payment = 0
  end

  def show_menu
    p @menu.list
  end

  def start_order(order_ref = gen_order_ref)
    @curr_order = @order.new(order_ref)
  end

  def complete_order(order_ref, amount)
    customer_payment(order_ref, amount)
    p "Thank you! Your order #{@curr_order.order_ref} was placed and will be delivered before 18:52"
  end

  private

  def customer_payment(order_ref, amount)
    raise StandardError.new("No such order reference") if order_ref != @curr_order.order_ref
    raise StandardError.new("You have not paid the correct total amount") if amount != @curr_order.total
    p 'Payment received'
  end

  def gen_order_ref
    order_ref = rand(10)*rand(10)
  end

end
