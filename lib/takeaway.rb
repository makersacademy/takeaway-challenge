require_relative 'menu.rb'
require_relative 'order.rb'
require_relative 'text.rb'

class Takeaway
  
  attr_reader :menu, :order
  
  def initialize
    @menu = Menu.new
    @order = Order.new
  end
  
  def read_menu
    @menu.menu.each { |x| puts "#{x[:item]} @ £#{x[:price]} each" }
  end
  
  def add_to_order(item, qty = 1)
    @order.add(item, qty, @menu.return_price(item))
  end

  def order_total
    "Order total is: £#{@order.total}"
  end
  
  def show_order
    @order.order.each { |x| puts "#{x[:qty]}x #{x[:item]} @ £#{x[:price]} each" }
  end
  
  def finalise_order
    send_text("Thank you! Your order was placed and will be delivered before 18:52")
  end
  
end
