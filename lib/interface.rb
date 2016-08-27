require_relative 'menu'
require_relative 'order'
require_relative 'adapter'

# Understands how to interact with the user
class Interface
  def initialize(options_hash)
    puts 'Welcome to Tom\'s Takeaway!'
    @menu = options_hash.fetch(:menu){Menu.new}
    @order_class = options_hash.fetch(:order){Order}
    @adapter = options_hash.fetch(:adapter){Adapter.new}
    @current_order = nil
  end

  def show_menu
    menu.show_menu
  end

  def new_order
    @current_order = order_class.new(menu)
  end

  def order(item = nil, quantity = 1)
    open_order?
    current_order.add_to_order(item, quantity)
  end

  def review_order
    open_order?
    current_order.review_order
  end

  def checkout(payment_amount = 0)
    open_order?
    current_order.checkout(payment_amount)
    adapter.send_sms(create_message_online(payment_amount))
    reset_current_order
  end

  def check_mobile_orders #needs tests
    valid_orders = find_valid_orders
    execute_orders(valid_orders)
    adapter.update_messages
    puts "#{valid_orders.length} valid order(s) received and completed."
  end

  private

  attr_reader :adapter, :current_order, :menu, :order_class

  def open_order?
    fail 'Please start a new order' if current_order.nil?
  end

  def create_message_online(amount)
    time = (Time.now + (60 * 60)).strftime('at %I:%M%p')
    "Your order of #{amount}AUD will be delivered #{time}."
  end

  def create_message_text
    time = (Time.now + (60 * 60)).strftime('at %I:%M%p')
    "Thank you for your mobile order. It will be delivered #{time}."
  end

  def execute_orders(valid_orders)
    valid_orders.each do |order|
      new_order
      parse_orders(order)
      adapter.send_sms(create_message_text)
      reset_current_order
    end
  end

  def find_valid_orders
    adapter.download_inbound_messages.select{|_f, b| b =~ /\w+-\d+/}
  end

  def reset_current_order
    @current_order = nil
  end

  def parse_orders(order_body)
    order_body.split(', ').each do |item|
      arr = item.split('-')
      order(arr[0],arr[1].to_i)
    end
  end
end
