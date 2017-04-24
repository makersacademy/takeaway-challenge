require_relative 'restaurant'
require_relative 'text_service'
require_relative 'order'

class Takeaway # understands creating an order

  attr_reader :menu, :order, :restaurant

  def initialize
    @order = Order.new
    @text_service = TextService.new
  end

  def view_menu
    @restaurant = Restaurant.new
    @restaurant.view
  end

  def view_order
    puts "Your order comes to £#{(@order.order_total).to_s}."
  end


  def add_item(item, quantity)
    @order.add(item, quantity)
  end

  def submit_order
    @order.check_order? ? @text_service.send_text : raise("There was a problem with your order.")
  end

end
