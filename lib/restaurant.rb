require_relative "takeaway"
require_relative "menu"
require_relative "order"

class Restaurant
  attr_reader :name
  attr_reader :restaurant_menu
  attr_reader :orders_history
  attr_accessor :order
 
  def initialize(menu = Menu.new)
    @name = "Plants Power"
    @restaurant_menu = menu
    @order = nil
    @orders_history = []
  end
  
  def amend_name(name)
    @name = name
  end
  
  def create_order(address, mobile, *items) # pass address, mobile e.g. "Street 12, New York, 12345", "01234567890" + array e.g. ['Tomato soup', 2], ['Pizza', 1]
    basket = Order.new(restaurant_menu)
    basket.add_customer_details(address, mobile)
    items.each { |item| basket.add_item(item.first, item.last) }
    basket.order_total
    @order = basket
  end
  
  def complete_order(takeaway = Takeaway.new)
    takeaway.notification(order)
    orders_history.push(order, time: Time.now)
    @order = nil
    orders_history
  end
  
end
