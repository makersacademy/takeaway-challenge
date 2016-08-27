require_relative 'menu'
require_relative 'order'
require_relative 'adapter'

# Understands how to interface with the user
class Interface
  def initialize(options_hash)
    puts 'Welcome to Tom\'s Takeaway!'
    @menu = options_hash.fetch(:menu, Menu.new)
    @order_class = options_hash.fetch(:order, Order)
    @adapter = options_hash.fetch(:adapter, Adapter.new)
    @current_order = nil
  end

  def show_menu
    @menu.show_menu
  end

  def new_order
    @current_order = @order_class.new(@menu)
  end

  def order(item = nil, quantity = 1)
    current_order?
    @current_order.add_to_order(item, quantity)
  end

  def review_order
    current_order?
    @current_order.review_order
  end

  def checkout(payment_amount = 0)
    current_order?
    @current_order.checkout(payment_amount)
    @adapter.send_sms(create_message(payment_amount))
    @current_order = nil
  end

  private

  def current_order?
    raise 'Please start a new order' if @current_order.nil?
  end

  def create_message(amount)
    time = (Time.now + (60 * 60)).strftime('at %I:%M%p')
    "Your order of #{amount}AUD will be delivered #{time}"
  end
end
