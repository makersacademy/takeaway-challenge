require_relative 'order'
require_relative 'menu'

class Restaurant

  attr_reader :menu, :order

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def new_order(order = Order.new)
    @order = order
  end

  def place_order(amount)
    fail "The total is incorrect" unless @order.sum == amount
    send_text
  end

  def send_text
    delivery_time = (Time.now+(60*60)).strftime("%H:%M")
    puts "Thank you! Your order was placed and will be delivered before #{delivery_time}."
  end



end