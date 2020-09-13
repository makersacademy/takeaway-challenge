require_relative 'order'
require_relative 'menu'

class Restaurant

  attr_reader :menu, :order

  def initialize(menu_class = Menu)
    @menu = menu_class.new
  end

  def new_order(order_class = Order )
    @order = order_class.new
  end

  def finalise_order(amount)
    @order.verify(amount)
    send_text
  end

  def send_text
    delivery_time = (Time.now+(60*60)).strftime("%H:%M")
    puts "Thank you! Your order was placed and will be delivered before #{delivery_time}."
  end



end